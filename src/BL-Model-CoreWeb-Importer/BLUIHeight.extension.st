Extension { #name : #BLUIHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHeight class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'height' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIHeight class >> createAttributeFor: anInvocation [
	^ self new
		text: (self getAttributeValueFrom: anInvocation);
		yourself
]
