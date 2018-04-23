adding
addLinkBetweenWidgets
	self listOfWidget
		do: [ :widget |
			| variable |
			variable := self searchAffectationForInvocation: widget constructor.
			variable allUsages.]