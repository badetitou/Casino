private
linkFromWidgetActionAppel
	" At the end, collection of link (link = Association between a BLWidget and a BLPhase). Should have ~ 2000"

	^ self getPhaseCallInvocations
		collect: [ :el | 
			| link |
			link := self linkFromWidgetActionAppelCase1: el.
			link ifNil: [ link := self linkFromWidgetActionAppelCase2: el ].
			link ]
		thenSelect: #isNotNil