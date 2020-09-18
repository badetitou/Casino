Extension { #name : #CSNBuComplexType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> printServiceDeserializeOn: aCSNExporter [
	aCSNExporter <<< 'deserializeArray(' <<< self innerName <<< ', JSON.stringify(res), { excludeExtraneousValues: true })'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> writeBusinessTypeOn: aCSNExporter [
	self flag: 'todo'.
	aCSNExporter <<< 'any'
]
