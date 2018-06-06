"
I am the chain of responsability that convert the AST from FAST
"
Class {
	#name : #BLConverterHandler,
	#superclass : #Object,
	#instVars : [
		'next',
		'model'
	],
	#category : 'BL-Model-CoreWeb-Importer'
}

{ #category : #'as yet unclassified' }
BLConverterHandler >> handleIdentifier: anIndentifier [
	self subclassResponsibility 
]

{ #category : #accessing }
BLConverterHandler >> model [
	^ model
]

{ #category : #accessing }
BLConverterHandler >> model: aModel [
	model := aModel.
	self next ifNotNil: [ self next model: aModel ]
]

{ #category : #accessing }
BLConverterHandler >> next [
	^ next
]
