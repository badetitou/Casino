Class {
	#name : #CSNBehaviorModelImporterJava,
	#superclass : #CSNBehaviorModelImporter,
	#instVars : [
		'carrefourBinder'
	],
	#category : #'Casino-Behavior-Model-Importer-Java'
}

{ #category : #run }
CSNBehaviorModelImporterJava >> bindWithUIModel: model [
	self carrefourBinder bindFastModel: model fromFamixMethodEntity: (model allWithType: FASTJavaMethodEntity)
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> carrefourBinder [
	^ carrefourBinder
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> carrefourBinder: anObject [
	carrefourBinder := anObject
]

{ #category : #run }
CSNBehaviorModelImporterJava >> convertFastToBehavioral: model [
	CSNBehaviorPattern
		allSubclassesDo:
			[ :patternClass | (patternClass on: model fromUiModel: self uiModel) run ]
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> convertibleActions [
	"We only convert these actions"

	^ self uiModel allCSNAction
	select:
			[ :action | action isActionService not and: [ action isActionAppel not ] ]
]

{ #category : #api }
CSNBehaviorModelImporterJava >> generateBehavioralModel [
	| models |
	models := OrderedCollection new.
	self convertibleActions
		do: [ :action | models add: (self generateFASTModelFor: action) ]
		displayingProgress: [ :action | 'Generate AST for ' , action asString ].
	models
		do: [ :model | self convertFastToBehavioral: model ]
		displayingProgress: [ :model | 'Converting ' , model asString ].
	^ models
]

{ #category : #run }
CSNBehaviorModelImporterJava >> generateFASTModelFor: action [
	"Compute the FAST model for action and bind it to the Famix model"

	self parser model: self newBehavioralModel.
	action source methods
		do:
			[ :aFamixMethod | "Create the FAST model" self parser parseCodeMethodString: aFamixMethod sourceText ].
	self carrefourBinder
		bindFastModel: self parser model
		fromFamixMethodEntity: action source methods first.
	self parser model allFASTJavaMethodEntity
		select: [ :method | method parentNode isNil ]
		thenDo: [ :behavior | action behavior add: behavior ].
	^ self parser model
]

{ #category : #initialization }
CSNBehaviorModelImporterJava >> initialize [
	super initialize.
	self carrefourBinder: CRFBinderVisitor new.
	self parser: JavaSmaCCProgramNodeImporterVisitor new
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> newBehavioralModel [
	^ MooseModel new
		metamodel:
			(MooseModel
				metamodelComposedOf:
					{FASTJavaMetamodelGenerator metamodel.
					CSNBehaviorModelGenerator metamodel.
					CSNLayoutMetamodelGenerator metamodel});
		yourself
]

{ #category : #api }
CSNBehaviorModelImporterJava >> resetUIAndGenerateBehavioralModel [
	self uiModel allCSNAction
		do: [ :action | action behavior removeAll ].
	^ self generateBehavioralModel
]