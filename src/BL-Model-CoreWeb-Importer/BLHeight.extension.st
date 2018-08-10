Extension { #name : #BLHeight }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLHeight class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'height' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLHeight class >> createAttributeFor: anInvocation [
	^ self new
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		yourself
]
