Extension { #name : #CSNCoreHorizontalAlignement }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreHorizontalAlignement class >> canHandle: anInvocation [
	^ anInvocation isInvocation and: [ anInvocation attributeName = 'horizontalalignment' ]
]

{ #category : #'*Casino-Model-CoreWeb-Importer' }
CSNCoreHorizontalAlignement class >> createAttributeFrom: anInvocation for: aWidgetInstance withImporter: anImporter [
	aWidgetInstance ifNil: [ ^ CSNLAlignement createAlignementWithHorizontal: (anInvocation parameters first) andVertical: nil  ].
	^ aWidgetInstance subWidgets do: [:widget | widget position: (CSNLAlignement createAlignementWithHorizontal: (anInvocation parameters first) andVertical: nil) ].
]
