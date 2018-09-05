Extension { #name : #BLUIInputColor }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputColor >> getExternalDependency [
	^ {PNGColorPicker}
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputColor >> getSelector [
	^ 'p-colorPicker'
]
