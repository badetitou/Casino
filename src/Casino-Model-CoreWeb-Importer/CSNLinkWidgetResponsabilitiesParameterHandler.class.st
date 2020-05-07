Class {
	#name : #CSNLinkWidgetResponsabilitiesParameterHandler,
	#superclass : #CSNLinkWidgetResponsabilitiesHandler,
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #handlers }
CSNLinkWidgetResponsabilitiesParameterHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	'parameter handler' record.
	((aCollectionOfUsages collect: #receiver thenSelect: [ :receiver | receiver class = FAMIXParameter ])
		ifEmpty: [ false ]
		ifNotEmpty: [ :collection | 
			| parametersName invocations variables |
			invocations := collection flatCollect: [ :parameter | parameter parentBehaviouralEntity incomingInvocations ].
			parametersName := invocations flatCollect: #parameters.
			variables := invocations collect: [ :callingMethod | callingMethod source findAttributeNamed: (parametersName at: 1) ].
			self addLinkedFromVariable: variables to: widgetContainer in: theCurrentImporter ])
		ifFalse: [ self next
				handleAddLinkedFromVariable: aCollectionOfUsages
				to: widgetContainer
				withXmlui: xmluiLinkTable
				andImporter: theCurrentImporter ]
]

{ #category : #initialization }
CSNLinkWidgetResponsabilitiesParameterHandler >> initialize [
	super initialize.
	next := CSNLinkWidgetResponsabilitiesContainerReceiverHandler new
]
