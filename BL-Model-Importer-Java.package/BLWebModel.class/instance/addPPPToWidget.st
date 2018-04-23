adding
addPPPToWidget
	(self listOfWidget select: [ :a | a containerWidget isNil ])
		do: [ :widget | 
			| found |
			found := self widgetOwnerCase1: widget source from.
			found ifNotNil: [ found widgets add: widget ] ]