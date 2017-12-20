initialization
createPhaseInModel: aPhase
	^ BLMoosePhase new
		name: aPhase codeValue;
		realClassName: aPhase realClassName;
		codeValue: aPhase codeValue;
		codePhase: aPhase codePhase