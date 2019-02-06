Extension { #name : #CSNUIPanel }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	self layout addWidget: aWidget withInvocationOfAdd: anInvocation 
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel class >> canHandle: anInvocation [
	^ 'BLImageUploadPanel' ~= anInvocation invokedClassName
		and: [ 'BLFileUploadPanel' ~= anInvocation invokedClassName
				and: [ (#('FlexTable' 'BLFlexTable' 'BLGrid') includes: anInvocation invokedClassName)
						or: [ ('.*Panel' asRegex matchesPrefix: anInvocation invokedClassName) ] ] ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	widget layout: (CSNLayout newCoreLayoutFor: anInvocation).
	(anInvocation parameters size >= 2)
		ifTrue: [ widget addAttribute: (CSNUIWidth new name: 'width'; attributeValue: (anInvocation parameters at: 2) )].
	^ widget
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNUIPanel >> getSelector [
	^ (self layout isNotNil and: [ self layout specificSelector ])
		ifTrue: [ self layout getSelector ]
		ifFalse: [ 'bl-panel' ]
]
