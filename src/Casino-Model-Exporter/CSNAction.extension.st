Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Exporter' }
CSNAction >> accept: anExporter [
	^ anExporter visitAction: self 

]
