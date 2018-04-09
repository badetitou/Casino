initialization
generatePageMetierfrom: aBlApplication
	aBlApplication modelPageMetier
		do:
			[ :aPhase | self listOfPageMetier add: (self createPageMetierInModel: aPhase) ]