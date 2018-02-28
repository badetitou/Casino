initialization
generateBLActionAppelFrom: aBlApplication
	self listOfActionAppel
		addAll:
			(aBlApplication linkWidgetFromPPPhase
				collect: [ :el |
					 BLActionAppel new
						from: (self getWidgetFromWidgetConstructor: el key constructor);
						to: (self getPhaseFromClass: el value) ])