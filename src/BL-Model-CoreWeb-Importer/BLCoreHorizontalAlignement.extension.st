Extension { #name : #BLCoreHorizontalAlignement }

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreHorizontalAlignement class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'horizontalalignment' ]
]

{ #category : #'*BL-Model-CoreWeb-Importer' }
BLCoreHorizontalAlignement class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance subWidgets do: [:widget | widget position: (BLAlignement createAlignementWithHorizontal: (anInvocation parameters first) andVertical: nil) ].
]
