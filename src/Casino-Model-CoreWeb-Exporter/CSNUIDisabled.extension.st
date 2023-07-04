Extension { #name : #CSNUIDisabled }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIDisabled >> attributeValue [

	^ self disabled
		  ifNil: [ '' ]
		  ifNotNil: [ self disabled printString ]
]
