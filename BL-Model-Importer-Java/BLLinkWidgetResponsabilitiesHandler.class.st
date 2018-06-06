Class {
	#name : #BLLinkWidgetResponsabilitiesHandler,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : 'BL-Model-Importer-Java'
}

{ #category : #accessing }
BLLinkWidgetResponsabilitiesHandler >> addLinkedFromVariable: variables to: widgetContainer in: theCurrentImporter [
	(variables
		collect: [ :var | theCurrentImporter listOfWidgetContainer at: var ifAbsent: [  ] ]
		thenSelect: #isNotNil)
		ifNotEmpty: [ :founds | 
			founds do: [ :found | found blWidget addWidget: widgetContainer blWidget ].
			^ true ].
	^ false
]

{ #category : #accessing }
BLLinkWidgetResponsabilitiesHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	self subclassResponsibility
]

{ #category : #accessing }
BLLinkWidgetResponsabilitiesHandler >> next [
	^ next
]
