as yet unclassified
generateBLActionAppel
	self linkWidgetFromPPPhase
		do: [ :el | 
			| action |
			action := BLActionAppel new.
			el key actionsAppel add: action.
			el value ifNil: [ ] ifNotNil: [ el value actions add: action ] ]