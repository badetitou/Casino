Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLLayout class >> canHandle: anInvocation [
	^ true
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLLayout class >> createCoreLayoutFor: anInvocation [
	^ self new
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLLayout class >> newCoreLayoutFor: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newCoreLayoutFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation)
		ifTrue: [ ^ self createCoreLayoutFor: anInvocation ]
		ifFalse: [ ^ nil ]
]
