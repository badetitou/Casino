Extension { #name : #CSNModelExporter }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModelExporter >> visitHTML: aBLHTML [
	^ self visitUIContainer: aBLHTML
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModelExporter >> visitSplitButton: aBLHTML [
	^ self visitUIContainer: aBLHTML
]
