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
		do: [ :action | models addAll: (self generateFASTModelFor: action) ]
		displayingProgress: [ :action | 'Generate AST for ' , action asString ].
	models
		do: [ :model | self convertFastToBehavioral: model ]
		displayingProgress: [ :model | 'Converting ' , model asString ].
	^ models
]

{ #category : #run }
CSNBehaviorModelImporterJava >> generateFASTModelFor: action [
	"Compute the FAST model for action and bind it to the Famix model"

	| models |
	models := OrderedCollection new.
	action source methods
		do: [ :aFamixMethod | 
			"Create the FAST model"
			self parser model: self newBehavioralModel.
			self parser parseCodeMethodString: aFamixMethod sourceText.
			self carrefourBinder bindFastModel: self parser model fromFamixMethodEntity: aFamixMethod.
			self parser model allFASTJavaMethodEntity select: [ :method | method parentNode isNil ] thenDo: [ :behavior | action behavior add: behavior ].
			models add: self parser model ].
	^ models
]

{ #category : #initialization }
CSNBehaviorModelImporterJava >> initialize [
	super initialize.
	self carrefourBinder: CRFBinderVisitor new.
	self parser: JavaSmaCCProgramNodeImporterVisitor new.
	FASTJavaMetamodelGenerator resetMetamodel.
	FASTMetamodelGenerator resetMetamodel.
	CSNBehaviorModelGenerator resetMetamodel.
	CSNLayoutMetamodelGenerator resetMetamodel
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> newBehavioralModel [
	^ MooseModel new
		metamodel:
			(MooseModel
				metamodelComposedOf:
					{FASTJavaMetamodelGenerator metamodel.
					FASTMetamodelGenerator metamodel.
					CSNBehaviorModelGenerator metamodel.
					CSNLayoutMetamodelGenerator metamodel});
		yourself
]

{ #category : #initialization }
CSNBehaviorModelImporterJava >> resetNeededMetamodels [
	
	FASTJavaMetamodelGenerator resetMetamodel.
	FASTMetamodelGenerator resetMetamodel.
	CSNBehaviorModelGenerator resetMetamodel.
	CSNLayoutMetamodelGenerator resetMetamodel
]

{ #category : #api }
CSNBehaviorModelImporterJava >> resetUIAndGenerateBehavioralModel [
	self resetNeededMetamodels.
	self uiModel allCSNAction
		do: [ :action | action behavior removeAll ].
	^ self generateBehavioralModel
]
