Class {
	#name : #CSNLinkWidgetResponsabilitiesAffectationHandler,
	#superclass : #CSNLinkWidgetResponsabilitiesHandler,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #handlers }
CSNLinkWidgetResponsabilitiesAffectationHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	'affectation handler' record.
	(self addLinkedFromVariable: (aCollectionOfUsages collect: #affectation) to: widgetContainer in: theCurrentImporter)
		ifFalse: [ self next
				handleAddLinkedFromVariable: aCollectionOfUsages
				to: widgetContainer
				withXmlui: xmluiLinkTable
				andImporter: theCurrentImporter ]
]

{ #category : #initialization }
CSNLinkWidgetResponsabilitiesAffectationHandler >> initialize [
	super initialize.
	next := CSNLinkWidgetResponsabilitiesParameterHandler new
]
