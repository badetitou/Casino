private
linkFromWidgetActionAppel
	" Miss 7
	4 for dispatch -> ignore
	3 for carousel"
	^ self getPhaseCallInvocations
		collect: [ :el | 
			| link |
			link := self linkFromWidgetActionAppelCase1: el.
			link ifNil: [ link := self linkFromWidgetActionAppelCase2: el ].
			link ]
		thenSelect: #isNotNil