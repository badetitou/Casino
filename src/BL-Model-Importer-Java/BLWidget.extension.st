Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> addDefaultAttribute [
	"you can extend me to add default attributes to self"

	
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget class >> canHandle: anInvocation [
	^ true
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> createAttributeFrom: anInvocation [
	^ (BLAttribute newFrom: anInvocation for: self) ifNotNil: [ :attribute | self addAttribute: attribute. attribute  ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget class >> createWidgetFor: anInvocation [
	^ self new
		constructor: anInvocation;
		realClass: anInvocation invokedClass;
		name: anInvocation asString;
		source: anInvocation;
		yourself
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget class >> newFor: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation)
		ifTrue: [ ^ self createWidgetFor: anInvocation ]
		ifFalse: [ ^ nil ]
]
