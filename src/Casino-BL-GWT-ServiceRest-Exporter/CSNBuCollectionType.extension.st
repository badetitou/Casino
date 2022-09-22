Extension { #name : #CSNBuCollectionType }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuCollectionType >> writeJavaBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'List<'.
	self type writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
