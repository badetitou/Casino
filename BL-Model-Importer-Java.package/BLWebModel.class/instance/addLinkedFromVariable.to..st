adding
addLinkedFromVariable: variables to: widgetContainer
	(variables collect: [ :var | self listOfWidgetContainer at: var ifAbsent: [  ] ] thenSelect: #isNotNil)
		ifNotEmpty: [ :founds | 
			founds do: [ :found | found blWidget widgets add: widgetContainer blWidget ].
			^ true ].
	^ false