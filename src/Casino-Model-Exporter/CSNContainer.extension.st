Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNContainer >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNContainer: self
]
