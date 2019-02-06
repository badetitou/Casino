Class {
	#name : #CSNLinkWidgetResponsabilitiesXmluiHandler,
	#superclass : #CSNLinkWidgetResponsabilitiesHandler,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #handlers }
CSNLinkWidgetResponsabilitiesXmluiHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	xmluiLinkTable
		at: ((widgetContainer source from atScope: FAMIXClass) at: 1)
		ifPresent: [ :listOfWidgetClass | 
			listOfWidgetClass
				do:
					[ :widgetClass | (theCurrentImporter model allBLWidgetExceptPage select: [ :widget | widget realClass = widgetClass ]) do: [ :widget | widget addWidget: widgetContainer ] ] ]
]
