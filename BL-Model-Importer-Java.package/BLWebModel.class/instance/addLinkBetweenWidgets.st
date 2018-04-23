adding
addLinkBetweenWidgets
	self listOfWidgetContainer
		do: [ :widgetContainer | 
			(widgetContainer isKindOf: OrderedCollection)
				ifFalse: [ ((widgetContainer affectedActions allUsages collect: #receiver)
						collect: [ :var | self listOfWidgetContainer at: var ifAbsent: [  ] ]
						thenSelect: #isNotNil)
						ifNotEmpty: [ :founds | founds do: [ :found | found blWidget widgets add: widgetContainer blWidget ] ]
						ifEmpty: [ self flag: #superClassDependency ] ]
				ifTrue: [ widgetContainer do: [ :widget | self halt ] ] ]