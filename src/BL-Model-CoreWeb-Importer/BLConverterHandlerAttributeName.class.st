Class {
	#name : #BLConverterHandlerAttributeName,
	#superclass : #BLConverterHandler,
	#category : 'BL-Model-CoreWeb-Importer'
}

{ #category : #'as yet unclassified' }
BLConverterHandlerAttributeName >> handleIdentifier: anIndentifier [
	self flag: #todo.
	false
		ifFalse: [ self next handleIdentifier: anIndentifier ]
]

{ #category : #initialization }
BLConverterHandlerAttributeName >> initialize [
	super initialize.
	next := BLConverterHandlerService new
]
