private
linkWidgetFromPPPhase
	self flag: #stillWorkToDoWithLocalVariable.
	^ self getPhaseCallInvocations
		collect: [ :el | 
			| link elConstructor |
			elConstructor := el.
			[ elConstructor isNotNil and: [ (elConstructor candidates at: 1) isConstructor not ] ]
				whileTrue: [ elConstructor := elConstructor previous ].
			elConstructor
				ifNil: [ self modelWidgetInstances
						do: [ :aWidgetInvocation | 
							el from belongsTo isAnonymousClass
								ifTrue: [ | expectedVariable |
									expectedVariable := (self correspondingAccesses: el from belongsTo belongsTo accesses toInvocation: el)
										ifNotNil: [ :access | access variable ]
										ifNil: [ self correspondingAccesses: el from belongsTo belongsTo localVariables toInvocation: el ].
									expectedVariable
										ifNotNil: [ (self getPotentialAttributeFromConstructor: aWidgetInvocation constructor) = expectedVariable
												ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhaseFromInvocation: el) ] ] ] ] ]
				ifNotNil: [ self widgetInstanceFromPhaseAndPageMetier
						do: [ :aWidgetInvocation | 
							aWidgetInvocation constructor = elConstructor
								ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhaseFromInvocation: el) ] ] ].
			link ]
		thenSelect: #isNotNil