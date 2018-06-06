Class {
	#name : #BLConverterHandlerService,
	#superclass : #BLConverterHandler,
	#category : 'BL-Model-CoreWeb-Importer'
}

{ #category : #'as yet unclassified' }
BLConverterHandlerService >> handleIdentifier: anIndentifier [
	self flag: #todo.
	(self model allBLService select: [ :service | service name = anIndentifier name ])
		ifEmpty: [ self next handleIdentifier: anIndentifier ]
		ifNotEmpty: [ :serviceInCollection | anIndentifier name: (serviceInCollection at: 1) getVariableName  ]
]

{ #category : #initialization }
BLConverterHandlerService >> initialize [
	super initialize.
	next := BLConverterHandlerPopup  new
]
