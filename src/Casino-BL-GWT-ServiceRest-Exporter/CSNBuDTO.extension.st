Extension { #name : #CSNBuDTO }

{ #category : #'*Casino-BL-GWT-ServiceRest-Exporter' }
CSNBuDTO >> writeJavaBusinessTypeOn: aCSNExporter [

	self source
		ifNotNil: [ :aSource | aCSNExporter <<< aSource name ]
		ifNil: [ aCSNExporter <<< 'Object' ]
]
