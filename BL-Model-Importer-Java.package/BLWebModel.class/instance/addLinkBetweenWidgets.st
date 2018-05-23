adding
addLinkBetweenWidgets
	| responsabilityHandlerForUsages |
	responsabilityHandlerForUsages := BLLinkWidgetResponsabilitiesReceiverHandler new.
	self listOfWidgetContainer
		do: [ :widgetContainer | 
			(widgetContainer isKindOf: OrderedCollection)
				ifFalse: [ | usages |
					usages := widgetContainer affectedActions allUsages.
					
					responsabilityHandlerForUsages handleAddLinkedFromVariable: usages to: widgetContainer withXmlui: xmlUiWidgetLink andImporter: self.
					]
				ifTrue: [ widgetContainer
						do: [ :widget | 
							| containerInvocation |
							containerInvocation := widget blWidget constructor container.
							[ containerInvocation isNotNil ]
								whileTrue: [ self listOfWidgetContainer
										at: containerInvocation receiver
										ifPresent: [ :found | 
											found blWidget addWidget: widget blWidget.
											containerInvocation := nil ]
										ifAbsent: [ containerInvocation := containerInvocation container ] ] ] ] ]