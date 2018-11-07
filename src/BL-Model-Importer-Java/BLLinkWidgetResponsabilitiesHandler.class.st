Class {
	#name : #BLLinkWidgetResponsabilitiesHandler,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : 'BL-Model-Importer-Java'
}

{ #category : #accessing }
BLLinkWidgetResponsabilitiesHandler >> addLinkedFromMapVariableInvocationOfAdd: mapVariableInvocationOfAdd to: widgetContainer in: theCurrentImporter [
	((mapVariableInvocationOfAdd collect: [ :VariableInvocationOfAdd | (theCurrentImporter widgetInVariable: VariableInvocationOfAdd key) -> VariableInvocationOfAdd value ])
		select: [ :assoc | assoc key isNotNil ])
		ifNotEmpty: [ :founds | 
			founds do: [ :found | found key addWidget: widgetContainer withInvocationOfAdd: found value ].
			^ true ].
	^ false
]

{ #category : #accessing }
BLLinkWidgetResponsabilitiesHandler >> addLinkedFromVariable: variables to: widgetContainer in: theCurrentImporter [
	(variables
		collect: [ :var | theCurrentImporter widgetInVariable: var ]
		thenSelect: #isNotNil)
		ifNotEmpty: [ :founds | 
			founds do: [ :found | found addWidget: widgetContainer ].
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
