Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Exporter-generated' }
CSNWidget >> accept: aCSNModelExporter [
	^ aCSNModelExporter visitCSNWidget: self
]

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> getInitializations [
	^ ''
]

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> getVariables [
	^ ''
]
