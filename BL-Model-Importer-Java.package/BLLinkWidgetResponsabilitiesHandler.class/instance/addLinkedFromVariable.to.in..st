accessing
addLinkedFromVariable: variables to: widgetContainer in: theCurrentImporter
	(variables
		collect: [ :var | theCurrentImporter listOfWidgetContainer at: var ifAbsent: [  ] ]
		thenSelect: #isNotNil)
		ifNotEmpty: [ :founds | 
			founds do: [ :found | found blWidget addWidget: widgetContainer blWidget ].
			^ true ].
	^ false