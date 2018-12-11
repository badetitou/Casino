Class {
	#name : #BLLinkWidgetResponsabilitiesXmluiHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : #'BL-Model-CoreWeb-Importer'
}

{ #category : #handlers }
BLLinkWidgetResponsabilitiesXmluiHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	xmluiLinkTable
		at: ((widgetContainer source from atScope: FAMIXClass) at: 1)
		ifPresent: [ :listOfWidgetClass | 
			listOfWidgetClass
				do:
					[ :widgetClass | (theCurrentImporter model allBLWidgetExceptPage select: [ :widget | widget realClass = widgetClass ]) do: [ :widget | widget addWidget: widgetContainer ] ] ]
]
