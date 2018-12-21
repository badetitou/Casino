Extension { #name : #BLCoreRowSpan }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreRowSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'rowspan' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreRowSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		source: anInvocation;
		attributeValue: (anInvocation parameters third);
		widget: aWidgetInstance;
		yourself
]
