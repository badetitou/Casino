accessing
modelAsyncInstance
	^ {(self modelPageMetier , self modelPhases)} flatten
				flatCollect: [ :element | 
					| listClass invocations |
					listClass := element superclassHierarchy.
					listClass add: element.
					invocations := (listClass flatCollect: #outgoingInvocations)
						select: [ :e | 
							| candidate |
							candidate := e candidates at: 1.
							candidate isConstructor and: (self modelAsync includes: candidate parentType) ].
					invocations
						collect: [ :invocation | 
							| instance |
							instance := BLWidgetInstance new.
							instance link: (Association new key: element value: instance).
							instance widgetClass: (invocation candidates at: 1) parentType.
							instance constructor: invocation ] ] 