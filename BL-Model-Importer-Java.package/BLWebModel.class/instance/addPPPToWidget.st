adding
addPPPToWidget
	(self listOfWidget select: [ :a | a containerWidget isNil ])
		do: [ :widget | 
			| founds |
			founds := self widgetOwnerCase1: widget source from.
			founds ifNotNil: [ founds do: [ :found | found widgets add: widget ] ] ] 