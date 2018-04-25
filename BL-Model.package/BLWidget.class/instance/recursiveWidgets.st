accessing
recursiveWidgets
	^ (self widgets , (self widgets collect: #recursiveWidgets))