*BL-Model-CoreWeb-Importer
newFrom: anInvocation for: aWidgetInstance
	self subclasses
		do: [ :subclass | 
			| try |
			try := subclass newFrom: anInvocation for: aWidgetInstance.
			try ifNotNil: [ ^ try ] ].
	(self canHandle: anInvocation for: aWidgetInstance)
		ifTrue: [ aWidgetInstance widgets
				do: [ :subWidget | 
					subWidget attributes add: (BLWidthChild new subpart: 12 / aWidgetInstance widgets size).
					 ].^ self createAttributeFor: anInvocation ]
		ifFalse: [ ^ nil ]