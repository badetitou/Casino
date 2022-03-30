Extension { #name : #CSNBuComplexType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> printServiceDeserializeOn: aCSNExporter [

	aCSNExporter <<< 'this.objectMapper.parse<'.
	self writeBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>(JSON.stringify(res), ' inBraces: [ 
		aCSNExporter << 'mainCreator: () => ['.
		self printJsonClassTypeOn: aCSNExporter.
		aCSNExporter <<< ']' ].
	aCSNExporter <<< ');'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> writeBusinessTypeOn: aCSNExporter [
	self flag: 'todo'.
	aCSNExporter <<< 'any'
]
