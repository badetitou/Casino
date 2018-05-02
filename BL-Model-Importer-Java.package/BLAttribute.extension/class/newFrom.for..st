*BL-Model-Importer-Java
newFrom: anInvocation for: aWidgetInstance
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFor: anInvocation.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation for: aWidgetInstance )
		ifTrue: [ ^ self createAttributeFor: anInvocation ]
		ifFalse: [ ^ nil ]