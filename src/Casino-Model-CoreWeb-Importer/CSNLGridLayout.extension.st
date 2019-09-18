Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLGridLayout classSide >> canHandle: anInvocation [
	^ #('BLFlexTable' 'FlexTable' 'BLGrid') includes: anInvocation invokedClassName
]
