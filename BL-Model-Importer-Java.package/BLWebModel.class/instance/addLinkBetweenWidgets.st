adding
addLinkBetweenWidgets
	self listOfWidgetContainer
		do: [ :widgetContainer |
			(self listOfWidgetContainer select: [ :a | (widgetContainer affectedActions allUsages collect: #receiver) includes: a variable ]) ifNotEmpty: [ self halt ].
			self halt. 
			]