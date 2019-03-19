Extension { #name : #CSNActionService }

{ #category : #'*Casino-Model-Exporter' }
CSNActionService >> accept: anExporter [
	^ anExporter visitActionService: self 
]
