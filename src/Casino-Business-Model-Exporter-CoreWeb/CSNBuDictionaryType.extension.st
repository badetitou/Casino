Extension { #name : #CSNBuDictionaryType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> printDeserializeOn: aCSNExporter forAttributeNamed: aName [
	aCSNExporter <<< '@deserializeAs(' <<< self value name <<< ')'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'Map<'.
	self key writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
