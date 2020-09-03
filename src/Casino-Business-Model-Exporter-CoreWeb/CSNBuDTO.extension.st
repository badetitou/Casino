Extension { #name : #CSNBuDTO }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> printDeserializeOn: aCSNExporter forAttributeNamed: aName [
	aCSNExporter <<< '@deserialize'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'any'
]
