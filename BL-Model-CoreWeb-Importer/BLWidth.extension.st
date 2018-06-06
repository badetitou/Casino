Extension { #name : #BLWidth }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLWidth class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'width' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLWidth class >> createAttributeFor: anInvocation [
	^ self new
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		yourself
]
