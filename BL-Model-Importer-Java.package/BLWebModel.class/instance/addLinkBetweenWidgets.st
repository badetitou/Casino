adding
addLinkBetweenWidgets
	self listOfWidgetContainer
		do: [ :widgetContainer | 
			(widgetContainer isKindOf: OrderedCollection)
				ifFalse: [ | usages |
					usages := widgetContainer affectedActions allUsages.
					(self addLinkedFromVariable: (usages collect: #receiver) to: widgetContainer)
						ifFalse: [ self addLinkedFromVariable: (usages collect: #affectation) to: widgetContainer ] ]
				ifTrue: [ widgetContainer
						do: [ :widget | 
							| containerInvocation |
							containerInvocation := widget blWidget constructor container.
							[ containerInvocation isNotNil ]
								whileTrue: [ self listOfWidgetContainer
										at: containerInvocation receiver
										ifPresent: [ :found | 
											found blWidget widgets add: widget blWidget.
											containerInvocation := nil ]
										ifAbsent: [ containerInvocation := containerInvocation container ] ] ] ] ]