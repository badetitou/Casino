Extension { #name : #CSNCoreColSpan }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreColSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'colspan' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreColSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		source: anInvocation;
		attributeValue: (anInvocation parameters third);
		widget: aWidgetInstance;
		yourself
]
