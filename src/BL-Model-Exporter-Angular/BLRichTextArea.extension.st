Extension { #name : #BLRichTextArea }

{ #category : #'*BL-Model-Exporter-Angular' }
BLRichTextArea >> getExternalDependency [
	^ {PNGEditor}
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLRichTextArea >> getSelector [
	^ 'p-editor'
]
