Extension { #name : #BLUITitle }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITitle class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'title' ]
]
