Extension { #name : #BLCoreVerticalAlignement }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreVerticalAlignement class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'verticalalignment' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreVerticalAlignement class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance subWidgets do: [:widget | widget position: (BLAlignement createAlignementWithHorizontal: nil andVertical: (anInvocation parameters first)) ].
]
