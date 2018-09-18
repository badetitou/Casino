Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Exporter' }
BLWidget >> accept: anExporter [
	^ anExporter visitBLWidget: self 

]

{ #category : #'*BL-Model-Exporter' }
BLWidget >> getInitializations [
	^ ''
]

{ #category : #'*BL-Model-Exporter' }
BLWidget >> getVariables [
	^ ''
]
