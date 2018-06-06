Class {
	#name : #BLLinkWidgetResponsabilitiesAffectationHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : 'BL-Model-Importer-Java'
}

{ #category : #initialization }
BLLinkWidgetResponsabilitiesAffectationHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	(self
		addLinkedFromVariable: (aCollectionOfUsages collect: #affectation)
		to: widgetContainer
		in: theCurrentImporter )
		ifFalse: [ self next
				handleAddLinkedFromVariable: aCollectionOfUsages
				to: widgetContainer
				withXmlui: xmluiLinkTable
				andImporter: theCurrentImporter ]
]

{ #category : #initialization }
BLLinkWidgetResponsabilitiesAffectationHandler >> initialize [
	super initialize.
	next := BLLinkWidgetResponsabilitiesParameterHandler new
]
