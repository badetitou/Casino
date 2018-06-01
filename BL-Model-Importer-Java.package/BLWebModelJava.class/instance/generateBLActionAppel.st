as yet unclassified
generateBLActionAppel
	self linkFromWidgetActionAppel
		do: [ :el | 
			| action |
			action := BLActionAppel new.
			el key actionAppels add: action.
			el value ifNil: [ ] ifNotNil: [ el value actionAppels add: action ] ]