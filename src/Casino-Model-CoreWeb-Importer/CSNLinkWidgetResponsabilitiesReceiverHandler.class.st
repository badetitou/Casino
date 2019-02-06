Class {
	#name : #CSNLinkWidgetResponsabilitiesReceiverHandler,
	#superclass : #CSNLinkWidgetResponsabilitiesHandler,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #handlers }
CSNLinkWidgetResponsabilitiesReceiverHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	(self addLinkedFromMapVariableInvocationOfAdd: (aCollectionOfUsages collect: [:el | el receiver -> el ]) to: widgetContainer in: theCurrentImporter)
		ifFalse: [ self next handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter ]
]

{ #category : #initialization }
CSNLinkWidgetResponsabilitiesReceiverHandler >> initialize [
	super initialize.
	next := CSNLinkWidgetResponsabilitiesAffectationHandler new.
]
