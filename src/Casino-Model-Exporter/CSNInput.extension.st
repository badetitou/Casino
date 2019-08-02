Extension { #name : #CSNInput }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNInput >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNInput: self
]
