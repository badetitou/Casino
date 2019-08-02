Extension { #name : #CSNUIInputFile }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNUIInputFile >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNUIInputFile: self
]
