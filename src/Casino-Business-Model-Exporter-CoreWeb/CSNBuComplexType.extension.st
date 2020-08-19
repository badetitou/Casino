Extension { #name : #CSNBuComplexType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> writeBusinessTypeOn: aCSNExporter [
	self flag: 'todo'.
	aCSNExporter <<< 'any'
]
