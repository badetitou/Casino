Extension { #name : #CSNUITree }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNUITree >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNUITree: self
]
