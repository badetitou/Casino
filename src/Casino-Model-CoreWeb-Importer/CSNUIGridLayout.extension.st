Extension { #name : #CSNUIGridLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIGridLayout class >> canHandle: anInvocation [
	^ #('BLFlexTable' 'FlexTable' 'BLGrid') includes: anInvocation invokedClassName
]
