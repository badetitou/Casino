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
CSNBuDTO >> parentBusinessPackages [

	^ self source
		  ifNotNil: [ :aSource |
			  aSource atScope: FamixTPackage until: [ :p | p name = 'model' ] ]
		  ifNil: [ {  } ]
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> printJsonClassOn: aCSNExporter [

	(self isBusinessType or: [ 
		 self isPrimitive or: [ self isComplexType ] ]) ifFalse: [ ^ self ].
	aCSNExporter << '@JsonClassType({ type: () => ['.
	self printJsonClassTypeOn: aCSNExporter.
	aCSNExporter
		<<< '] })';
		crlf
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> printJsonClassTypeOn: aCSNExporter [

	aCSNExporter <<< 'Object'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> printServiceDeserializeOn: aCSNExporter [

	aCSNExporter <<< 'res'
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> printServiceSerializeOn: aCSNExporter named: aName [

	aCSNExporter <<< aName
]

{ #category : #'*Casino-Business-Model-Exporter-CoreWeb' }
CSNBuDTO >> writeBusinessTypeOn: aCSNExporter [
	aCSNExporter <<< 'any'
]
