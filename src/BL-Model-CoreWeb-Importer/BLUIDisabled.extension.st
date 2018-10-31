Extension { #name : #BLUIDisabled }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIDisabled class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'enabled' ]
]
