Extension { #name : #CSNUICanvas }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNUICanvas >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNUICanvas: self
]
