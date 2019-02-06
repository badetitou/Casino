Extension { #name : #CSNCell }

{ #category : #'*Casino-Model-Exporter' }
CSNCell >> accept: anExporter [
	^ anExporter visitCell: self
]
