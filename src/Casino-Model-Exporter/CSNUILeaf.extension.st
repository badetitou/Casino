Extension { #name : #CSNUILeaf }

{ #category : #'*Casino-Model-Exporter' }
CSNUILeaf >> accept: anExporter [
	^ anExporter visitUILeaf: self
]
