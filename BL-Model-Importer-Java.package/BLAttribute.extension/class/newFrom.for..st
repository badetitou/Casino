*BL-Model-Importer-Java
newFrom: anInvocation for: aWidgetInstance
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: anInvocation for: aWidgetInstance .
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation for: aWidgetInstance )
		ifTrue: [ ^ self createAttributeFor: anInvocation ]
		ifFalse: [ ^ nil ]