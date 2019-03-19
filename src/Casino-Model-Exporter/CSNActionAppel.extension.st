Extension { #name : #CSNActionAppel }

{ #category : #'*Casino-Model-Exporter' }
CSNActionAppel >> accept: anExporter [
	^ anExporter visitActionAppel: self 
]
