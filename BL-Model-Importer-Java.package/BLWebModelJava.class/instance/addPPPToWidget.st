adding
addPPPToWidget
	(self listOfWidget select: [ :a | a widget isNil ])
		do: [ :widget | 
			| founds |
			founds := self widgetOwnerCase1: widget source from.
			founds ifNotNil: [ founds do: [ :found | found addWidget: widget ] ] ]