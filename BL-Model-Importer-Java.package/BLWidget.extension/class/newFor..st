*BL-Model-Importer-Java
newFor: anInvocation
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation)
		ifTrue: [ ^ self createWidgetFor: anInvocation ]
		ifFalse: [ ^ nil ]