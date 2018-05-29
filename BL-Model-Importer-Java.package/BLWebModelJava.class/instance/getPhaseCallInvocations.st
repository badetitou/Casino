private
getPhaseCallInvocations
	^ (((self sourceModel allClasses
		select:
			[ :a | '*ConstantsPhase' match: a mooseName ])
		at: 1) methods collect: #incomingInvocations) flatten