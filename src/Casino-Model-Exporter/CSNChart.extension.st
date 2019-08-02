Extension { #name : #CSNChart }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNChart >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNChart: self
]
