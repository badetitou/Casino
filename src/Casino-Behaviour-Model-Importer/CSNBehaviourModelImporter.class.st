Class {
	#name : #CSNBehaviourModelImporter,
	#superclass : #Object,
	#instVars : [
		'uiModel',
		'sourceCodeModel',
		'parser'
	],
	#category : #'Casino-Behaviour-Model-Importer'
}

{ #category : #accessing }
CSNBehaviourModelImporter >> generateBehaviouralModel [
	"I should return the generated model (normally 'behaviouralModel')"
	self subclassResponsibility
]

{ #category : #accessing }
CSNBehaviourModelImporter >> parser [
	"please initialize me"
	^ parser
]

{ #category : #accessing }
CSNBehaviourModelImporter >> parser: aParser [
	parser := aParser
]

{ #category : #accessing }
CSNBehaviourModelImporter >> sourceCodeModel [
	^ sourceCodeModel
]

{ #category : #accessing }
CSNBehaviourModelImporter >> sourceCodeModel: anObject [
	sourceCodeModel := anObject
]

{ #category : #accessing }
CSNBehaviourModelImporter >> uiModel [
	^ uiModel
]

{ #category : #accessing }
CSNBehaviourModelImporter >> uiModel: anObject [
	uiModel := anObject
]
