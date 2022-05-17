Extension { #name : #CSNBuComplexType }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> printServiceDeserializeOn: aCSNExporter [
	
	aCSNExporter <<< 'jsonParser.transform(res, ' inBraces: [ 
		aCSNExporter << 'mainCreator: () => ['.
		self printJsonClassTypeOn: aCSNExporter.
		aCSNExporter <<< ']' ].
	aCSNExporter <<< ')'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> printServiceSerializeOn: aCSNExporter named: aName [

	aCSNExporter <<< 'jsonStringifier.transform(' <<< aName <<< $)
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuComplexType >> writeBusinessTypeOn: aCSNExporter [
	self flag: 'todo'.
	aCSNExporter <<< 'any'
]
