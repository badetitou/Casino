Class {
	#name : #BLLinkWidgetResponsabilitiesReceiverHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : #'BL-Model-CoreWeb-Importer'
}

{ #category : #handlers }
BLLinkWidgetResponsabilitiesReceiverHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	(self addLinkedFromMapVariableInvocationOfAdd: (aCollectionOfUsages collect: [:el | el receiver -> el ]) to: widgetContainer in: theCurrentImporter)
		ifFalse: [ self next handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter ]
]

{ #category : #initialization }
BLLinkWidgetResponsabilitiesReceiverHandler >> initialize [
	super initialize.
	next := BLLinkWidgetResponsabilitiesAffectationHandler new.
]
