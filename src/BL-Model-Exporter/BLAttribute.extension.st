Extension { #name : #BLAttribute }

{ #category : #'*BL-Model-Exporter' }
BLAttribute >> accept: anExporter [
	^ anExporter visitBLAttribute: self 
]
