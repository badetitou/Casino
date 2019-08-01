Extension { #name : #CSNUIGridLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIGridLayout classSide >> canHandle: anInvocation [
	^ #('BLFlexTable' 'FlexTable' 'BLGrid') includes: anInvocation invokedClassName
]
