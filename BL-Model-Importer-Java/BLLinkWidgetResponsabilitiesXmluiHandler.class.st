Class {
	#name : #BLLinkWidgetResponsabilitiesXmluiHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : 'BL-Model-Importer-Java'
}

{ #category : #accessing }
BLLinkWidgetResponsabilitiesXmluiHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	xmluiLinkTable
		at: ((widgetContainer blWidget source from atScope: FAMIXClass) at: 1)
		ifPresent: [ :listOfWidgetClass | 
			listOfWidgetClass
				do:
					[ :widgetClass | (theCurrentImporter listOfWidget select: [ :widget | widget realClass = widgetClass ]) do: [ :widget | widget addWidget: widgetContainer blWidget ] ] ]
]
