Extension { #name : #BLCoreRowSpan }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreRowSpan class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'rowspan' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreRowSpan class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance layout
		cellX: anInvocation parameters first
		Y: anInvocation parameters second
		verticalSpan: anInvocation parameters third
]
