Extension { #name : #CSNCoreHorizontalAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreHorizontalAlignement class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'horizontalalignment' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreHorizontalAlignement class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	^ aWidgetInstance subWidgets do: [:widget | widget position: (CSNAlignement createAlignementWithHorizontal: (anInvocation parameters first) andVertical: nil) ].
]
