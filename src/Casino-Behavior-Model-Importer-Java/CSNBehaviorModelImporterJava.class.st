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
	"The first line is necessary to ensure that we can use parentNode and children"

	model metamodel: CSNBModel metamodel.
	(CSNBehaviorPattern allSubclasses sorted: #order ascending)
		collect: [ :patternClass | 
			patternClass new
				uiModel: self uiModel;
				yourself ]
		thenDo: [ :patternInstance | 
			patternInstance
				model: model;
				run ]
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> convertibleActions [
	"We only convert these actions"

	^ self uiModel allCSNAction select: [ :action | action isActionService not and: [ action isActionAppel not ] ]
]

{ #category : #api }
CSNBehaviorModelImporterJava >> generateBehavioralModel [
	| models |
	models := OrderedCollection new.
	self convertibleActions
		do: [ :action | models addAll: (self generateFASTModelFor: action) ]
		displayingProgress: [ :action | 'Generate AST for ' , action asString ].
	self
		execute: [ models
				withIndexDo: [ :model :index | 
					self convertFastToBehavioral: model.
					index \\ 200 = 0 ifTrue: [ ((index / models size) asFloat * 100) record ] ] ]
		recordedAs: 'Converting ' , models size printString , ' AST models in behavioral models'.
	^ models
]

{ #category : #run }
CSNBehaviorModelImporterJava >> generateFASTModelFor: action [
	"Compute the FAST model for action and bind it to the Famix model"

	^ action source methods
		select: [ :aFamixMethod | 
			aFamixMethod sourceText isEmpty ifTrue: [ ('Error with:' , aFamixMethod mooseName) record ].
			aFamixMethod sourceText isNotEmpty ]
		thenCollect: [ :aFamixMethod | 
			"Create the FAST model"
			[ self parser model: self newBehavioralModel.
			self parser parseCodeMethodString: aFamixMethod sourceText.
			self carrefourBinder bindFastModel: self parser model fromFamixMethodEntity: aFamixMethod.
			self parser model allFASTJavaMethodEntity
				select: [ :method | method parentNode isNil ]
				thenDo: [ :behavior | action behavior add: behavior ] ]
				on: Error
				do: [ :err | 
					('Error in parsing with:' , aFamixMethod mooseName) record.
					err signal ].
			self parser model ]
]

{ #category : #initialization }
CSNBehaviorModelImporterJava >> initialize [
	super initialize.
	self carrefourBinder: CRFBinderVisitor new.
	self parser: JavaSmaCCProgramNodeImporterVisitor new.
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> newBehavioralModel [
	^ CSNBModel new
]

{ #category : #api }
CSNBehaviorModelImporterJava >> resetUIAndGenerateBehavioralModel [
	self uiModel allCSNAction do: [ :action | action behavior removeAll ].
	^ self generateBehavioralModel
]
