Extension { #name : #CSNBuDictionaryType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> innerName [
	^ self value innerName
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> innerType [
	^ self value innerType
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> printDeserializeOn: aCSNExporter forAttributeNamed: aName [
	(aCSNExporter << '@Type(() => ' <<< self value name)
		<<< ')';
		crlf
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'Map<'.
	self key writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
