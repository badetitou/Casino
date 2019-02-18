Class {
	#name : #CSNLinkWidgetResponsabilitiesContainerReceiverHandler,
	#superclass : #CSNLinkWidgetResponsabilitiesHandler,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #handlers }
CSNLinkWidgetResponsabilitiesContainerReceiverHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	(self
		addLinkedFromVariable:
			(aCollectionOfUsages
				select: [ :usage | usage container isNotNil ]
				thenCollect: [ :usage | usage container receiver ])
		to: widgetContainer in: theCurrentImporter)
		ifFalse: [ self next
				handleAddLinkedFromVariable: aCollectionOfUsages
				to: widgetContainer
				withXmlui: xmluiLinkTable
				andImporter: theCurrentImporter ]
]

{ #category : #initialization }
CSNLinkWidgetResponsabilitiesContainerReceiverHandler >> initialize [
	super initialize.
	next := CSNLinkWidgetResponsabilitiesXmluiHandler new.
]
