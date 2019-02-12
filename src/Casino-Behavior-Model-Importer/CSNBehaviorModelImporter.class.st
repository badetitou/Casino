Class {
	#name : #CSNBehaviorModelImporter,
	#superclass : #Object,
	#instVars : [
		'uiModel',
		'sourceCodeModel',
		'parser'
	],
	#category : #'Casino-Behavior-Model-Importer'
}

{ #category : #accessing }
CSNBehaviorModelImporter >> generateBehaviouralModel [
	"I should return the generated model (normally 'behaviouralModel')"
	self subclassResponsibility
]

{ #category : #accessing }
CSNBehaviorModelImporter >> parser [
	"please initialize me"
	^ parser
]

{ #category : #accessing }
CSNBehaviorModelImporter >> parser: aParser [
	parser := aParser
]

{ #category : #accessing }
CSNBehaviorModelImporter >> sourceCodeModel [
	^ sourceCodeModel
]

{ #category : #accessing }
CSNBehaviorModelImporter >> sourceCodeModel: anObject [
	sourceCodeModel := anObject
]

{ #category : #accessing }
CSNBehaviorModelImporter >> uiModel [
	^ uiModel
]

{ #category : #accessing }
CSNBehaviorModelImporter >> uiModel: anObject [
	uiModel := anObject
]
