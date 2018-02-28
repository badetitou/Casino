initialization
generateBLActionAppelFrom: aBlApplication
	aBlApplication linkWidgetFromPPPhase do: [ :el |
		BLActionAppel new from: (self getWidgetFromWidgetConstructor: el key constructor); to: (self getPhaseFromClass: el value).
		 ]