Extension { #name : #CSNDialog }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNDialog >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNDialog: self
]
