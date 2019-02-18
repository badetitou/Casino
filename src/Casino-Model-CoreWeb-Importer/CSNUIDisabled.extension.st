Extension { #name : #CSNUIDisabled }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIDisabled class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'enabled' ]
]
