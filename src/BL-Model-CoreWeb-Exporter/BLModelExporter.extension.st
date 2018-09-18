Extension { #name : #BLModelExporter }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLModelExporter >> visitBLHTML: aBLHTML [
	^ self visitBLWidget: aBLHTML
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLModelExporter >> visitBLSplitButton: aBLHTML [
	^ self visitBLWidget: aBLHTML
]
