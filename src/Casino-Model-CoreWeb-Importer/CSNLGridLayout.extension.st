Extension { #name : #CSNLGridLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLGridLayout classSide >> canHandle: anInvocation [
	^ #('BLFlexTable' 'FlexTable' 'BLGrid') includesAny: (anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
]
