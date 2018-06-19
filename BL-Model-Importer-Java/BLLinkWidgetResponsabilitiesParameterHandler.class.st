Class {
	#name : #BLLinkWidgetResponsabilitiesParameterHandler,
	#superclass : #BLLinkWidgetResponsabilitiesHandler,
	#category : 'BL-Model-Importer-Java'
}

{ #category : #initialization }
BLLinkWidgetResponsabilitiesParameterHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	((aCollectionOfUsages collect: #receiver thenSelect: [ :receiver | receiver class = FAMIXParameter ])
		ifEmpty: [ false ]
		ifNotEmpty: [ :collection | | parametersName invocations variables |
			invocations := (collection flatCollect:  [ :parameter | parameter parentBehaviouralEntity incomingInvocations]).
			parametersName := invocations flatCollect: #parameters.
			variables := invocations collect: [ :callingMethod | callingMethod from findAttributeNamed: (parametersName at: 1).  ].
			(self addLinkedFromVariable: variables to: widgetContainer in: theCurrentImporter). ])
		ifFalse: [ self next
				handleAddLinkedFromVariable: aCollectionOfUsages
				to: widgetContainer
				withXmlui: xmluiLinkTable
				andImporter: theCurrentImporter ]
]

{ #category : #initialization }
BLLinkWidgetResponsabilitiesParameterHandler >> initialize [
	super initialize.
	next := BLLinkWidgetResponsabilitiesContainerReceiverHandler new
]
