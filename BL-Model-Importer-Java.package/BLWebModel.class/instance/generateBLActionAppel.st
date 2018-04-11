as yet unclassified
generateBLActionAppel
	self linkWidgetFromPPPhase
		do: [ :el | 
			| action |
			action := BLActionAppel new.
			(self getWidgetFromWidgetConstructor: el key constructor) actionsAppel add: action.
			el value actions add: action. ]