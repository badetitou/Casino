Extension { #name : #CSNLayout }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLayout classSide >> canHandle: anInvocation [
	^ true
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLayout classSide >> createCoreLayoutFor: anInvocation [
	^ self new
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNLayout classSide >> newCoreLayoutFor: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newCoreLayoutFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation)
		ifTrue: [ ^ self createCoreLayoutFor: anInvocation ]
		ifFalse: [ ^ nil ]
]
