accessing
linkWidgetFromPPPhase
	^ ((self model allMethods
		select: [ :e | e mooseName = 'fr::bl::client::core::incubator::ConstantsPhase::Util.get()' ])
		flatCollect: #incomingInvocations)
		collect: [ :el | el previous previous ]
		thenSelect: [ :el | 
			| allWidgetConstructor |
			allWidgetConstructor := self modelWidgetInstanceFromPhaseAndPageMetier
				collect: #constructor.
			allWidgetConstructor includes: el]