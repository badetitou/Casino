Extension { #name : #CSNUIFieldset }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNUIFieldset >> getSelectorFrom: anExporter [
	^ (anExporter angularRepresentationOf: self) getSelector
]
