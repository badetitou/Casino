Extension { #name : #CSNLHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLHorizontalLayout class >> canHandle: anInvocation [
	^ #('HorizontalPanel' 'BLHorizontalPanel') includes: anInvocation invokedClassName
]
