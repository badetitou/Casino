Extension { #name : #CSNLayout }

{ #category : #'*Casino-Model-Exporter' }
CSNLayout >> accept: anExporter [
	^ anExporter visitLayout: self
]
