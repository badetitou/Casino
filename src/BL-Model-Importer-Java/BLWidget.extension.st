Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> addDefaultAttribute [
	"you can extend me to add default attributes to self"

	
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> affectedActions [
	<MSEProperty: #affectedActions type: #Object>
	^ self privateState attributeAt: #affectedActions ifAbsent: nil
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> affectedActions: anObject [
	self privateState attributeAt: #affectedActions put: anObject
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> createAttributeFrom: anInvocation [
	^ BLAttribute newFrom: anInvocation for: self
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> createAttributeFromAngularInvocation: anInvocation withImporter: anImporter [
	^ BLAttribute newFrom: anInvocation for: self withImporter: anImporter
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget class >> createWidgetFor: anInvocation [
	^ self new
		realClass: anInvocation invokedClass;
		source: anInvocation;
		yourself
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget class >> defaultIfNotFoundFor: anInvocation [
	^ BLUIContainer new
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
		ifFalse: [ ^ self defaultIfNotFoundFor: anInvocation ]
]

{ #category : #'*BL-Model-Importer-Java' }
BLWidget >> variable [
	(self affectedActions isKindOf: FAMIXAccess) ifTrue: [ ^ self affectedActions variable ].
	^ self affectedActions
]
