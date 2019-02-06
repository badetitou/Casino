Extension { #name : #CSNLayout }

{ #category : #'*Casino-Model-Exporter' }
CSNLayout >> accept: anExporter [
	^ anExporter visitBLLayout: self
]
