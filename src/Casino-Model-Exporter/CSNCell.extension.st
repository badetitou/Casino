Extension { #name : #CSNCell }

{ #category : #'*Casino-Model-Exporter' }
CSNCell >> accept: anExporter [
	^ anExporter visitBLCell: self
]
