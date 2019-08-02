Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNServiceAPI >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNServiceAPI: self
]
