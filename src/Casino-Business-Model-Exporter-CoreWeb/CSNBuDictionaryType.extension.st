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
CSNBuDictionaryType >> innerTypeDependencies [

	^ { 
		  self key innerTypeDependencies.
		  self value innerTypeDependencies }
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> printJsonClassTypeOn: aCSNExporter [
	aCSNExporter <<< 'Map, ['.
	self key printJsonClassTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value printJsonClassTypeOn: aCSNExporter.
	aCSNExporter <<< ']'.
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDictionaryType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'Map<'.
	self key writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
