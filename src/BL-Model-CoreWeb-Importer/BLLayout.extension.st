Extension { #name : #BLLayout }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLayout class >> canHandle: anInvocation [
	^ true
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLayout class >> createCoreLayoutFor: anInvocation [
	^ BLUIHorizontalLayout new.
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLLayout class >> newCoreLayoutFor: anInvocation [
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation)
		ifTrue: [ ^ self createCoreLayoutFor: anInvocation ]
		ifFalse: [ ^ nil ]
]
