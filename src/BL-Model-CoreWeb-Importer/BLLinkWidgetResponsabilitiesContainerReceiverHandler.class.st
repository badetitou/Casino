Class {
	#name : #BLLinkWidgetResponsabilitiesContainerReceiverHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : #'BL-Model-CoreWeb-Importer'
}

{ #category : #handlers }
BLLinkWidgetResponsabilitiesContainerReceiverHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
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
BLLinkWidgetResponsabilitiesContainerReceiverHandler >> initialize [
	super initialize.
	next := BLLinkWidgetResponsabilitiesXmluiHandler new.
]
