as yet unclassified
widgetInstanceFromPhaseAndPageMetier
	^ {(self modelPhases  , self modelPageMetier)} flatten
		flatCollect: [ :element | 
			| invocations |
			invocations := (element withSuperclassHierarchy flatCollect: #outgoingInvocations)
				select: [ :e | 
					| candidate |
					candidate := e candidates at: 1.
					candidate isConstructor and: [ self modelWidget includes: candidate parentType ] ].
			invocations
				collect: [ :invocation | 
					| instance |
					instance := BLWidgetInstance new.
					instance link: (Association new key: element value: instance).
					instance widgetClass: (invocation candidates at: 1) parentType.
					instance constructor: invocation ] ]