Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> canHandle: aFAMIXElement [
	^ false
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> canHandle: anInvocation for: aWidgetInstance [
	^  self canHandle: anInvocation 
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		source: anInvocation ;
		name: anInvocation attributeName;
		attributeValue: (self getAttributeValueFrom: anInvocation);
		widget: aWidgetInstance;
		yourself
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ self createAttributeFrom: anInvocation for: aWidgetInstance 
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> getAttributeValueFrom: anInvocation [
	^ anInvocation parameters first
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> newFrom: anInvocation for: aWidgetInstance [
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

{ #category : #'*Casino-Model-Importer-Java' }
CSNAttribute class >> newFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
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
