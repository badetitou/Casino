Extension { #name : #CSNBuSetType }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuSetType >> writeJavaBusinessTypeOn: aCSNExporter [

	aCSNExporter <<< 'Set<'.
	self type writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
