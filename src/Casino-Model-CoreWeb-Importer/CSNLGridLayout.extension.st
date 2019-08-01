Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLGridLayout class >> canHandle: anInvocation [
	^ #('BLFlexTable' 'FlexTable' 'BLGrid') includes: anInvocation invokedClassName
]
