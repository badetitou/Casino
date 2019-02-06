Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Model-Exporter' }
CSNAttribute >> accept: anExporter [
	^ anExporter visitBLAttribute: self 
]
