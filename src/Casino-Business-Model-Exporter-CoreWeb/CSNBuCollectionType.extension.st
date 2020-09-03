Extension { #name : #CSNBuCollectionType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuCollectionType >> printDeserializeOn: aCSNExporter forAttributeNamed: aName [
	aCSNExporter <<< '@deserializeAs(' <<< self type name <<< ')'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuCollectionType >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'Array<'.
	self type writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
