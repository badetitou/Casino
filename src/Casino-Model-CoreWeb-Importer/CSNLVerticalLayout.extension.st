Extension { #name : #CSNLVerticalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLVerticalLayout class >> canHandle: anInvocation [
	^ #('VerticalPanel' 'BLVerticalPanel') includesAny: (anInvocation invokedClass withSuperclassHierarchy collect: #invokedClassName)
]
