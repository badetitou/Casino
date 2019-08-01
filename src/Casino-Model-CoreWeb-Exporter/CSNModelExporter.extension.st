Extension { #name : #CSNModelExporter }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModelExporter >> visitHTML: aCSNHTML [
	^ self visitUIContainer: aCSNHTML
]

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNModelExporter >> visitSplitButton: aCSNSplitButto [
	^ self visitUIContainer: aCSNSplitButto
]
