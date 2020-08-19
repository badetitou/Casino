Extension { #name : #CSNBuPrimitive }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuPrimitive >> writeBusinessTypeOn: aCSNExporter [
	self flag: 'todo'.
	aCSNExporter <<< 'any'
]
