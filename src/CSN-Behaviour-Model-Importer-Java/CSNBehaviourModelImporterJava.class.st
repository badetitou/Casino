Class {
	#name : #CSNBehaviourModelImporterJava,
	#superclass : #CSNBehaviourModelImporter,
	#category : #'CSN-Behaviour-Model-Importer-Java'
}

{ #category : #accessing }
CSNBehaviourModelImporterJava >> generateBehaviouralModel [
	| models |
	models := OrderedCollection new.
	(self uiModel allBLAction select: [ :action | action isActionService not and: [ action isActionAppel not ] ])
		do: [ :action | 
			self parser model: FASTMooseModel new.
			models add: (self parser model).
			action
				behaviour: ((self parser parseCodeMethodString: action source methods first sourceText) allFASTJavaMethodEntity select: [ :method | method parentNode isNil ]) first. ]
		displayingProgress: [ :action | 'compute behavioural code of ' , action caller name ]
		every: 10.
	^ models
]

{ #category : #accessing }
CSNBehaviourModelImporterJava >> initialize [
	"The default importer which creates a FAST model is the one of SmaCC"
	self parser: JavaSmaCCProgramNodeImporterVisitor new
]
