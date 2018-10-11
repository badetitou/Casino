Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGridLayout class >> canHandle: anInvocation [
	^ #('BLFlexTable' 'BLGrid') includes: anInvocation invokedClassName
]
