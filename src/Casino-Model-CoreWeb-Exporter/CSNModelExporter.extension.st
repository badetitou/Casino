Extension { #name : #CSNModelExporter }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModelExporter >> visitBLHTML: aBLHTML [
	^ self visitBLUIContainer: aBLHTML
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModelExporter >> visitBLSplitButton: aBLHTML [
	^ self visitBLUIContainer: aBLHTML
]
