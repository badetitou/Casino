Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Exporter' }
BLUIContainer >> accept: anExporter [
	^ anExporter visitBLUIContainer: self
]
