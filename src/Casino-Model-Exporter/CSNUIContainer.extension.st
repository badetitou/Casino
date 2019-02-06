Extension { #name : #CSNUIContainer }

{ #category : #'*Casino-Model-Exporter' }
CSNUIContainer >> accept: anExporter [
	^ anExporter visitUIContainer: self
]
