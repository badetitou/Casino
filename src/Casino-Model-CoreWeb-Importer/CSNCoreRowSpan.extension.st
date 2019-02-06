Extension { #name : #CSNCoreRowSpan }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreRowSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'rowspan' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreRowSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		source: anInvocation;
		attributeValue: (anInvocation parameters third);
		widget: aWidgetInstance;
		yourself
]
