Class {
	#name : #BLLinkWidgetResponsabilitiesReceiverHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : 'BL-Model-Importer-Java'
}

{ #category : #initialization }
BLLinkWidgetResponsabilitiesReceiverHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	"Giving the receiver and the invocation (it's usefull for a widget to know the invocation sometimes. example : For the grid to determine the position of an element."
	(self addLinkedFromMapVariableInvocationOfAdd: (aCollectionOfUsages collect: [:el | el receiver -> el ]) to: widgetContainer in: theCurrentImporter)
		ifFalse: [ self next handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter ]
]

{ #category : #initialization }
BLLinkWidgetResponsabilitiesReceiverHandler >> initialize [
	super initialize.
	next := BLLinkWidgetResponsabilitiesAffectationHandler new.
]
