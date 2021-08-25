Extension { #name : #CSNLHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLHorizontalLayout class >> canHandle: anInvocation [
	^ #('HorizontalPanel' 'BLHorizontalPanel') includesAny: (anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
]
