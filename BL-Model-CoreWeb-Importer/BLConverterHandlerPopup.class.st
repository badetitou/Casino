Class {
	#name : #BLConverterHandlerPopup,
	#superclass : #BLConverterHandler,
	#category : 'BL-Model-CoreWeb-Importer'
}

{ #category : #'as yet unclassified' }
BLConverterHandlerPopup >> handleIdentifier: anIndentifier [
	(anIndentifier name = 'BLEventPopup') ifTrue: [ anIndentifier name: 'this._toastrService'. ^ true ] ifFalse: [ ^ false ]
]
