Extension { #name : #CSNBuDictionaryType }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuDictionaryType >> writeJavaBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'Map<'.
	self key writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
