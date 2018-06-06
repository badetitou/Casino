Extension { #name : #BLToggleable }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLToggleable class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLToggleable class >> createAttributeFor: anInvocation [
	^ self new
		name: 'toggleable';
		attributeValue: 'true';
		yourself
]
