Extension { #name : #CSNModel }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNModel >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNModel: self
]
