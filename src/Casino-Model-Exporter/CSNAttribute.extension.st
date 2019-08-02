Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNAttribute >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNAttribute: self
]
