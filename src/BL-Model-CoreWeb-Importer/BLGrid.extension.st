Extension { #name : #BLGrid }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLGrid >> addWidget: aWidget withInvocationOfAdd: anInvocation [
	| param |
	param := anInvocation parameters.
	(self privateState attributeAt: #widgetPosition ifAbsentPut: [ OrderedCollection new ])
		add:
			aWidget ->
					{(param at: 1).
					(param at: 2)}.
	self addWidget: aWidget
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLGrid class >> canHandle: anInvocation [
	^ ('BLFlexTable|BLGrid' substrings: '|') includes: anInvocation invokedClassName
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLGrid class >> createWidgetFor: anInvocation [
	| widget |
	widget := super createWidgetFor: anInvocation.
	^ widget
]
