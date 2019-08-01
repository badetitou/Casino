Extension { #name : #CSNLCell }

{ #category : #'*Casino-Model-Exporter' }
CSNLCell >> accept: anExporter [
	^ anExporter visitCell: self
]
