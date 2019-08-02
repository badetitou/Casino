Extension { #name : #CSNUIValue }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNUIValue >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNUIValue: self
]
