Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNAction >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNAction: self
]
