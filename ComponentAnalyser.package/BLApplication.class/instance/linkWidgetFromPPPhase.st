accessing
linkWidgetFromPPPhase
	^ linkWidgetFromPPPhaseCache
		ifNil: [ linkWidgetFromPPPhaseCache := ((self model allMethods
				select: [ :e | e mooseName = 'fr::bl::client::core::incubator::ConstantsPhase::Util.get()' ])
				flatCollect: #incomingInvocations)
				collect: [ :el | 
					| link elConstructor |
					elConstructor := el.
					[ elConstructor isNotNil and: [ (elConstructor candidates at: 1) isConstructor not ] ]
						whileTrue: [ elConstructor := elConstructor previous ].
					elConstructor
						ifNil: [ self modelWidgetInstanceFromPhaseAndPageMetier
								do: [ :aWidgetInvocation | 
									| receiverVariable |
									"el sender parentType belongsTo outgoingInvocations select: [ :invocation | invocation previous = el ]"
									receiverVariable := self getPotentialAttributeFromConstructor: aWidgetInvocation constructor.
									el sender belongsTo isAnonymousClass
										ifTrue: [ el next
												ifNotNil: [ :a | 
													a receiver
														ifNotNil: [ :b | 
														
															b = receiverVariable
																ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ] ] ] ] ]
						ifNotNil: [ self modelWidgetInstanceFromPhaseAndPageMetier
								do: [ :aWidgetInvocation | 
									aWidgetInvocation constructor = elConstructor
										ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ] ].
					link ]
				thenSelect: #isNotNil ]