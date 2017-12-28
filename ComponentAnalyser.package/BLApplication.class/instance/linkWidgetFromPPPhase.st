accessing
linkWidgetFromPPPhase
	^ linkWidgetFromPPPhaseCache ifNil: [ linkWidgetFromPPPhaseCache := ((self model allMethods
		select: [ :e | e mooseName = 'fr::bl::client::core::incubator::ConstantsPhase::Util.get()' ])
		flatCollect: #incomingInvocations)
		collect: [ :el | 
			| link |
			self modelWidgetInstanceFromPhaseAndPageMetier
				do: [ :aWidgetInvocation | 
					aWidgetInvocation constructor = el previous previous
						ifTrue: [ link := Association new key: aWidgetInvocation value: (self searchCalledPhase: el) ] ].
			link ] thenSelect: #isNotNil. ]