as yet unclassified
generateBLActionAppelFrom: aBlApplication
	aBlApplication linkWidgetFromPPPhase
		do: [ :el | 
			| action |
			action := BLActionAppel new.
			(self getWidgetFromWidgetConstructor: el key constructor) actionsAppel add: action.
			(self getPhaseFromClass: el value) actions add: action. ]