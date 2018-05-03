accessing
isWidgetFromApplication: e
	^ (self isElementFromApplication: e)
		and: [ (({self listOfPhases.
			self listOfPageMetier} flatten collect: #source) includes: e) not ]