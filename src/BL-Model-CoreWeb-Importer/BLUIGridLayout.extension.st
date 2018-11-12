Extension { #name : #BLUIGridLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIGridLayout class >> canHandle: anInvocation [
	^ #('BLFlexTable' 'FlexTable' 'BLGrid') includes: anInvocation invokedClassName
]
