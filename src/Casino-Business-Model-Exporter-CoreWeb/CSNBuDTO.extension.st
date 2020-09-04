Extension { #name : #CSNBuDTO }

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> innerName [
	"Usefull for collection and map that can contain other collection and map"
	^ self subclassResponsibility
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> innerType [
	"Usefull for collection and map that can contain other collection and map"
	^ self
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> printDeserializeOn: aCSNExporter forAttributeNamed: aName [
	aCSNExporter <<< ''
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'any'
]
