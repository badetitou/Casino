Extension { #name : #CSNCoreVerticalAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreVerticalAlignement class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'verticalalignment' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreVerticalAlignement class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance subWidgets do: [:widget | widget position: (CSNAlignement createAlignementWithHorizontal: nil andVertical: (anInvocation parameters first)) ].
]
