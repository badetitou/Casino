Extension { #name : #CSNBuDictionaryType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'Map<'.
	self key writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
