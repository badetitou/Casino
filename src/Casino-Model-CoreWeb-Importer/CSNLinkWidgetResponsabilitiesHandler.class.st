"
receiver -> affectation -> parameter -> ContainerReceiver -> Xmlui
"
Class {
	#name : #CSNLinkWidgetResponsabilitiesHandler,
	#superclass : #Object,
	#instVars : [
		'next'
	],
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #accessing }
CSNLinkWidgetResponsabilitiesHandler >> addLinkedFromMapVariableInvocationOfAdd: mapVariableInvocationOfAdd to: widgetContainer in: theCurrentImporter [

	((mapVariableInvocationOfAdd collect: [ :VariableInvocationOfAdd | 
		  (theCurrentImporter widgetInVariable: VariableInvocationOfAdd key)
		  -> VariableInvocationOfAdd value ]) select: [ :assoc | 
		 assoc key isNotNil ]) ifNotEmpty: [ :founds | 
		founds do: [ :found | 
			| toAdd |
			toAdd := widgetContainer container
				         ifNil: [ widgetContainer ]
				         ifNotNil: [ widgetContainer verticalVeryDeepCopy ].
			found key
				addWidget: toAdd
				withInvocationOfAdd: found value
				usingFactory: theCurrentImporter factory ].
		^ true ].
	^ false
]

{ #category : #accessing }
CSNLinkWidgetResponsabilitiesHandler >> addLinkedFromVariable: variables to: widgetContainer in: theCurrentImporter [
	((variables collect: [ :var | theCurrentImporter widgetInVariable: var ] as: Set) select: #isNotNil)
		ifNotEmpty: [ :founds | 
			founds do: [ :found | 
				| toAdd |
				toAdd := widgetContainer container ifNil: [widgetContainer] ifNotNil: [ widgetContainer verticalVeryDeepCopy ].
				found addWidget: widgetContainer ].
			^ true ].
	^ false
]

{ #category : #handlers }
CSNLinkWidgetResponsabilitiesHandler >> handleAddLinkedFromVariable: aCollectionOfUsages to: widgetContainer withXmlui: xmluiLinkTable andImporter: theCurrentImporter [
	self subclassResponsibility
]

{ #category : #accessing }
CSNLinkWidgetResponsabilitiesHandler >> next [
	^ next
]
