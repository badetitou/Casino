Extension { #name : #BLUIInputFile }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputFile >> getExternalDependency [
	^ {PNGFileUpload}
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUIInputFile >> getSelector [
	^ 'p-fileUpload'
]
