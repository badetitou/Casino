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
BLAttribute class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		source: anInvocation ;
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ self createAttributeFrom: anInvocation for: aWidgetInstance 
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters at: 1
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> newFrom: anInvocation for: aWidgetInstance [
	"anInvocation isGetter ifTrue: [ ^ nil ]."
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: anInvocation for: aWidgetInstance .
			try ifNotNil: [ ^ try] ].
	(self canHandle: anInvocation for: aWidgetInstance )
		ifTrue: [ ^ self createAttributeFrom: anInvocation for: aWidgetInstance ]
		ifFalse: [ ^ nil ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLAttribute class >> newFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	"anInvocation isGetter ifTrue: [ ^ nil ]."
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: anInvocation for: aWidgetInstance withImporter: anImporter.
			try ifNotNil: [ ^ try] ].
	(self canHandle: anInvocation for: aWidgetInstance )
		ifTrue: [ ^ self createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter]
		ifFalse: [ ^ nil ]
]
