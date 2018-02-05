accessing
linkWidgetFromPPPhase
	self flag: #stillWorkToDoWithLocalVariable.
	^ linkWidgetFromPPPhaseCache
		ifNil: [ linkWidgetFromPPPhaseCache := ((self model allMethods
				select: [ :e | e mooseName = 'fr::bl::client::core::incubator::ConstantsPhase::Util.get()' ]) flatCollect: #incomingInvocations)
				collect: [ :el | 
					| link elConstructor |
					elConstructor := el.
					[ elConstructor isNotNil and: [ (elConstructor candidates at: 1) isConstructor not ] ] whileTrue: [ elConstructor := elConstructor previous ].
					elConstructor
						ifNil: [ self modelWidgetInstanceFromPhaseAndPageMetier
								do: [ :aWidgetInvocation | 
									el from belongsTo isAnonymousClass
										ifTrue: [ | expectedVariable |
											expectedVariable := (self correspondingAccesses: (el from belongsTo belongsTo accesses) toInvocation: el) ifNotNil: [ :access | access variable ]
												ifNil: [ self correspondingAccesses: el from belongsTo belongsTo localVariables toInvocation: el ].
											expectedVariable
												ifNotNil: [ (self getPotentialAttributeFromConstructor: aWidgetInvocation constructor) = expectedVariable
														ifTrue: [  link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ] ] ] ]
						ifNotNil: [ self modelWidgetInstanceFromPhaseAndPageMetier
								do: [ :aWidgetInvocation | 
									aWidgetInvocation constructor = elConstructor
										ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ] ].
					link]
				thenSelect: #isNotNil ]