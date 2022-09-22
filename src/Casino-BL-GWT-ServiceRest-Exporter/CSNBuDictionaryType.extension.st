Extension { #name : #CSNBuDictionaryType }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuDictionaryType >> writeJavaBusinessTypeOn: aCSNExporter [
	self source
		ifNotNil: [ :aSource | aCSNExporter <<< aSource name ]
		ifNil: [ aCSNExporter <<< 'Map' ].
	aCSNExporter <<< '<'.
	self key writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< ', '.
	self value writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
