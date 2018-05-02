adding
addLinkedFromVariable: variables to: widgetContainer
	(variables collect: [ :var | self listOfWidgetContainer at: var ifAbsent: [  ] ] thenSelect: #isNotNil)
		ifNotEmpty: [ :founds | 
			founds do: [ :found | found blWidget addWidget: widgetContainer blWidget ].
			^ true ].
	^ false