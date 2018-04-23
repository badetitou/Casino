adding
addLinkBetweenWidgets
	self listOfWidgetContainer
		do: [ :widgetContainer |
			
			((widgetContainer affectedActions allUsages collect: #receiver) collect: [ :var | self listOfWidgetContainer at: var ifAbsent: [  ] ] thenSelect: #isNotNil) ifNotEmpty: [ self halt ].
			]