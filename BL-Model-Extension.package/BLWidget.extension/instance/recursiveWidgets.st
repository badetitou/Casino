*BL-Model-Extension
recursiveWidgets
	^ (self widgets , (self widgets collect: #recursiveWidgets))