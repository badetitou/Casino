initialization
handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter
	(self
		addLinkedFromVariable: (aCollectionOfUsages collect: #affectation)
		to: widgetContainer
		in: theCurrentImporter )
		ifFalse: [ self next
				handleAddLinkedFromVariable: aCollectionOfUsages
				to: widgetContainer
				withXmlui: xmluiLinkTable
				andImporter: theCurrentImporter ]