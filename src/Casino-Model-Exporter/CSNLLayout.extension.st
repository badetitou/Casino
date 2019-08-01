Extension { #name : #CSNLLayout }

{ #category : #'*Casino-Model-Exporter' }
CSNLLayout >> accept: anExporter [
	^ anExporter visitLayout: self
]
