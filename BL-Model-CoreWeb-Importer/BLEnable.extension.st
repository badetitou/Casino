Extension { #name : #BLEnable }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLEnable class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'enabled' ]
]
