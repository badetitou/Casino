Extension { #name : #BLUIPanel }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> addWidget: aWidget [
	self layout addWidget: aWidget withInvocationOfAdd: nil 
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	self layout addWidget: aWidget withInvocationOfAdd: anInvocation 
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel class >> canHandle: anInvocation [
	^ ('.*Panel' asRegex matchesPrefix: anInvocation invokedClassName) or: [ #('BLFlexTable' 'BLGrid') includes: anInvocation invokedClassName ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel >> canHaveAttribute: blAttributeClass [
	^ blAttributeClass ~= BLUIWidth and: [ blAttributeClass ~= BLEnable ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLUIPanel class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget layout: (BLLayout createCoreLayoutFor: anInvocation).
	widget addAttribute: (BLUITitle new text: (anInvocation parameters at: 1 ifAbsent: [ 'todo' ])).
	(anInvocation parameters size >= 2)
		ifTrue: [ widget addAttribute: (BLUIWidth new text: (anInvocation parameters at: 2) )].
	^ widget
]
