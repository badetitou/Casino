Extension { #name : #CSNBuCollectionType }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuCollectionType >> writeJavaBusinessTypeOn: aCSNExporter [

	self source
		ifNotNil: [ :aSource | aCSNExporter <<< aSource name ]
		ifNil: [ aCSNExporter <<< 'List' ].
	aCSNExporter <<< '<'.
	self type writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
