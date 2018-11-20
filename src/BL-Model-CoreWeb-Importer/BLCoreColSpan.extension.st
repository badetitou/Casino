Extension { #name : #BLCoreColSpan }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreColSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'colspan' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreColSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance layout at: anInvocation setHorizontalSpan: (anInvocation parameters third)
	
]
