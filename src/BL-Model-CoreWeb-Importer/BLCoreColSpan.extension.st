Extension { #name : #BLCoreColSpan }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreColSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'colspan' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreColSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance [
	^ self new
		source: anInvocation;
		attributeValue: (anInvocation parameters third);
		widget: aWidgetInstance;
		yourself
]
