Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> addDefaultAttribute [
	"you can extend me to add default attributes to self"

	
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> affectedActions [
	<MSEProperty: #affectedActions type: #Object>
	^ self privateState attributeAt: #affectedActions ifAbsent: nil
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> affectedActions: anObject [
	self privateState attributeAt: #affectedActions put: anObject
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget class >> canHandle: anInvocation [
	^ false
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> createAttributeFrom: anInvocation [
	^ CSNAttribute newFrom: anInvocation for: self
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> createAttributeFromAngularInvocation: anInvocation withImporter: anImporter [
	^ CSNAttribute newFrom: anInvocation for: self withImporter: anImporter
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget class >> createWidgetFor: anInvocation [
	^ self new
		realClass:
			((#(#FactoryBLLabel #ComponentUtils) includes: anInvocation invokedClassName)
				ifTrue: [ nil ]
				ifFalse: [ anInvocation invokedClass ]);
		source: anInvocation;
		yourself
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget class >> defaultIfNotFoundFor: anInvocation [
	^ CSNUIContainer new
		realClass: anInvocation invokedClass;
		source: anInvocation;
		yourself
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget class >> newFor: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation)
		ifTrue: [ ^ self createWidgetFor: anInvocation ]
		ifFalse: [ ^ self defaultIfNotFoundFor: anInvocation ]
]

{ #category : #'*Casino-Model-Importer-Java' }
CSNWidget >> variable [
	(self affectedActions isKindOf: FAMIXAccess) ifTrue: [ ^ self affectedActions variable ].
	^ self affectedActions
]
