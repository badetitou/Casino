Class {
	#name : #BLLinkWidgetResponsabilitiesReceiverHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : 'BL-Model-Importer-Java'
}

{ #category : #initialization }
BLLinkWidgetResponsabilitiesReceiverHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	(self addLinkedFromVariable: (aCollectionOfUsages collect: #receiver) to: widgetContainer in: theCurrentImporter)
		ifFalse: [ self next handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter ]
]

{ #category : #initialization }
BLLinkWidgetResponsabilitiesReceiverHandler >> initialize [
	super initialize.
	next := BLLinkWidgetResponsabilitiesAffectationHandler new.
]
