initialization
createPhaseInModel: aPhase
	^ BLPhase new
		name: aPhase codeValue;
		realClassName: aPhase realClassName;
		codeValue: aPhase codeValue;
		codePhase: aPhase codePhase;
		yourself 