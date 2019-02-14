Class {
	#name : #CSNBehaviorModelImporterJava,
	#superclass : #CSNBehaviorModelImporter,
	#category : #'Casino-Behavior-Model-Importer-Java'
}

{ #category : #accessing }
CSNBehaviorModelImporterJava >> convertFastToBehavioral: model [
	CSNBehaviorPattern subclassesDo: [ :patternClass | (patternClass on: model) run ]
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> generateBehaviouralModel [
	| models |
	models := self generateFASTModels.
	models do: [ :model | self convertFastToBehavioral: model ] displayingProgress: [:model | 'Converting ' , model asString ].
	^ models
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> generateFASTModels [
	^ (self uiModel allCSNAction
		select:
			[ :action | action isActionService not and: [ action isActionAppel not ] ])
		collect: [ :action | 
			self parser model: self newBehavioralModel.
			action source methods
				do:
					[ :aFamixMethod | self parser parseCodeMethodString: aFamixMethod sourceText ].
			self parser model allFASTJavaMethodEntity
				select: [ :method | method parentNode isNil ]
				thenDo: [ :behavior | action behavior add: behavior ].
			self parser model ]
]

{ #category : #accessing }
CSNBehaviorModelImporterJava >> initialize [
	"The default importer which creates a FAST model is the one of SmaCC"
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
