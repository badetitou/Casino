Extension { #name : #CSNBuSetType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuSetType >> printJsonClassTypeOn: aCSNExporter [

	aCSNExporter <<< 'Set, ['.
	self type printJsonClassTypeOn: aCSNExporter.
	aCSNExporter <<< ']'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuSetType >> writeBusinessTypeOn: aCSNExporter [

	aCSNExporter <<< 'Set<'.
	self type writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
