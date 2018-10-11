Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Exporter' }
BLLayout >> accept: anExporter [
	^ anExporter visitBLLayout: self
]
