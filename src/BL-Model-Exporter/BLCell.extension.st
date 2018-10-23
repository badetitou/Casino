Extension { #name : #BLCell }

{ #category : #'*BL-Model-Exporter' }
BLCell >> accept: anExporter [
	^ anExporter visitBLCell: self
]
