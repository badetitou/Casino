Extension { #name : #BLUITitle }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITitle class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'title' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUITitle class >> createAttributeFor: anInvocation [
	^ self new
		text: (self getAttributeValueFrom: anInvocation);
		yourself
]
