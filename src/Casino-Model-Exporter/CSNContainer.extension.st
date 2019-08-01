Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Exporter' }
CSNContainer >> accept: anExporter [
	^ anExporter visitUIContainer: self
]
