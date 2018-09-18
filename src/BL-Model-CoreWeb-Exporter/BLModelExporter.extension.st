Extension { #name : #BLModelExporter }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLModelExporter >> visitBLHTML: aBLHTML [
	^ self visitBLUIContainer: aBLHTML
]

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLModelExporter >> visitBLSplitButton: aBLHTML [
	^ self visitBLUIContainer: aBLHTML
]
