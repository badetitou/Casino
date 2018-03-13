accessing
phasesLink
	^ (self getPhaseCallInvocations 
		collect: [ :invoc | self collectAssociationFrom: invoc ]
		thenSelect: [ :a | a value isNotNil ]) flattened