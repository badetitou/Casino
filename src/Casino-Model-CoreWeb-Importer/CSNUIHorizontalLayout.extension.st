Extension { #name : #CSNUIHorizontalLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIHorizontalLayout class >> canHandle: anInvocation [
	^ #('HorizontalPanel' 'BLHorizontalPanel') includes: anInvocation invokedClassName
]
