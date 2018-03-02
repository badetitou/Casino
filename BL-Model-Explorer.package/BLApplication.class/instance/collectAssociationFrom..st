accessing
collectAssociationFrom: e
	^ (self searchCandidatesInvokingPhaseFromAssociation: e)
		collect: [ :a | Association new key: a value: (self searchCalledPhase: e) ].