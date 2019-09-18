Extension { #name : #CSNLHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLHorizontalLayout classSide >> canHandle: anInvocation [
	^ #('HorizontalPanel' 'BLHorizontalPanel') includes: anInvocation invokedClassName
]
