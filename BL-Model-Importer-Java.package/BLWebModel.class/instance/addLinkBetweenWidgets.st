adding
addLinkBetweenWidgets
	self listOfWidgetContainer
		do: [ :widgetContainer |
			widgetContainer variable allUsages.
			self halt]