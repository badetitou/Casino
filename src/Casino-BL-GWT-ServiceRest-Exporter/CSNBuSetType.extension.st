Extension { #name : #CSNBuSetType }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuSetType >> writeJavaBusinessTypeOn: aCSNExporter [

	self source
		ifNotNil: [ :aSource | aCSNExporter <<< aSource name ]
		ifNil: [ aCSNExporter <<< 'Set' ].
	aCSNExporter <<< '<'.
	self type writeJavaBusinessTypeOn: aCSNExporter.
	aCSNExporter <<< '>'
]
