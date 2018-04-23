adding
addLinkBetweenWidgets
	self listOfWidgetContainer
		do: [ :widgetContainer | 
			(widgetContainer isKindOf: OrderedCollection)
				ifFalse: [ ((widgetContainer affectedActions allUsages collect: #receiver)
						collect: [ :var | self listOfWidgetContainer at: var ifAbsent: [  ] ]
						thenSelect: #isNotNil)
						ifNotEmpty:
							[ :founds | founds do: [ :found | found blWidget widgets add: widgetContainer blWidget ] ]
						ifEmpty: [ self flag: #superClassDependency ] ]
				ifTrue: [ widgetContainer
						do: [ :widget | 
							| containerInvocation |
							containerInvocation := widget blWidget constructor container.
							[ containerInvocation isNotNil and: [ containerInvocation receiver isNil ] ]
								whileTrue: [ containerInvocation
										ifNotNil: [ self listOfWidgetContainer
												at: containerInvocation receiver
												ifPresent: [ :found | 
													found blWidget widgets add: widget blWidget.
													containerInvocation := nil ]
												ifAbsent: [ containerInvocation := containerInvocation container ] ] ] ] ] ]