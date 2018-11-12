Extension { #name : #BLCoreColSpan }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreColSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'colspan' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreColSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance layout cellX: (anInvocation parameters first) Y: (anInvocation parameters second) horizontalSpan: (anInvocation parameters third)
	
]
