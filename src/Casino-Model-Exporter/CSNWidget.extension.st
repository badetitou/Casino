Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> accept: anExporter [
	^ anExporter visitBLWidget: self 

]

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> getInitializations [
	^ ''
]

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> getVariables [
	^ ''
]
