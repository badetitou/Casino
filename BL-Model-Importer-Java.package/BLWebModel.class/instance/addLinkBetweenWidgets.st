adding
addLinkBetweenWidgets
	self listOfWidget
		do: [ :widget |
			| variable |
			variable := self searchAffectationForInvocation: widget constructor.
			self halt ]