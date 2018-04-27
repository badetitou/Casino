accessing
isWidgetFromApplication: e
	^ ('*' , self applicationSource , '*' match: e sourceAnchor fileName)
		and: [ (({self listOfPhases.
			self listOfPageMetier} flatten collect: #source) includes: e)not ]