as yet unclassified
generateBLActionAppel
	actionAppelGroup := self linkFromWidgetActionAppel
		collect: [ :el | 
			| action |
			action := BLActionAppel new.
			el key actionAppels add: action.
			el value ifNil: [  ] ifNotNil: [ action phase: el value  ].
			action ]