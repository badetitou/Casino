Extension { #name : #BLUITable }

{ #category : #'*BL-Model-Exporter-Angular' }
BLUITable >> getExternalDependency [
	^ {PNGTurboTable}
]

{ #category : #'*BL-Model-Exporter-Angular' }
BLUITable >> getSelector [
	^ 'p-table'
]
