Extension { #name : #BLUIPanel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> addWidget: aWidget [
	self layout addWidget: aWidget withInvocationOfAdd: nil.
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	self layout addWidget: aWidget withInvocationOfAdd: anInvocation 
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel class >> canHandle: anInvocation [
	^ ('.*Panel' asRegex matchesPrefix: anInvocation invokedClassName)
		or: [ #('FlexTable' 'BLFlexTable' 'BLGrid') includes: anInvocation invokedClassName ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLUIDisabled
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget layout: (BLLayout newCoreLayoutFor: anInvocation).
	(anInvocation parameters size >= 2)
		ifTrue: [ widget addAttribute: (BLUIWidth new name: 'width'; text: (anInvocation parameters at: 2) )].
	^ widget
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> getSelector [
	^ (self layout isNotNil and: [ self layout specificSelector ])
		ifTrue: [ self layout getSelector ]
		ifFalse: [ 'bl-panel' ]
]
