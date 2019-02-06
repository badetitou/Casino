Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> accept: anExporter [
	^ anExporter visitWidget: self 

]

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> getInitializations [
	^ ''
]

{ #category : #'*Casino-Model-Exporter' }
CSNWidget >> getVariables [
	^ ''
]
