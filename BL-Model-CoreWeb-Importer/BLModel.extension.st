Extension { #name : #BLModel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLModel class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLModel class >> createAttributeFor: anInvocation [
	^ self new
		name: 'model';
		attributeValue: 'items';
		yourself
]
