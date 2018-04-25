accessing
getPhaseCallInvocations 
	^ (((self model allClasses
		select:
			[ :a | '*ConstantsPhase' match: a mooseName ])
		at: 1) methods
		select: [ :a | 
			'*PhaseMetadata'
				match: a declaredType mooseName ]
		thenCollect: #incomingInvocations) flatten