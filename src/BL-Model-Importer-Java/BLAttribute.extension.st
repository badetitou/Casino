Extension { #name : #BLAttribute }

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> canHandle: aFAMIXElement [
	^ false
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> canHandle: anInvocation for: aWidgetInstance [
	^ (aWidgetInstance canHaveAttribute: self) and: [ self canHandle: anInvocation ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> createAttributeFor: anInvocation [
	^ self new
		source: anInvocation ;
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		yourself
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters at: 1
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> newFrom: anInvocation for: aWidgetInstance [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: anInvocation for: aWidgetInstance .
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation for: aWidgetInstance )
		ifTrue: [ ^ self createAttributeFor: anInvocation ]
		ifFalse: [ ^ nil ]
]
