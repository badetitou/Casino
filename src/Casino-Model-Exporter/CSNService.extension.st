Extension { #name : #CSNService }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNService >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNService: self
]
