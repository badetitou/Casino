"
A CSNServiceAPITest is a test class for testing the behavior of CSNServiceAPI
"
Class {
	#name : #CSNServiceAPITest,
	#superclass : #TestCase,
	#instVars : [
		'serviceAPI',
		'testModel'
	],
	#category : #'Casino-Model-CoreWeb-Exporter-Tests'
}

{ #category : #tests }
CSNServiceAPITest >> create: anEntity [

	^ testModel add: anEntity new
]

{ #category : #running }
CSNServiceAPITest >> setUp [

	| metamodel |
	super setUp.
	metamodel := FMMetaModelBuilder metamodelFromPackages:
		             CSNBModel packagesToProcessToCreateMetamodel
		             , CRFModel packagesToProcessToCreateMetamodel
		             , CSNBuModel packagesToProcessToCreateMetamodel.
	testModel := CSNUICWModel new
		             name: 'test';
		             yourself.
	testModel metamodel: metamodel.
	serviceAPI := self create: CSNServiceAPI
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesCollectionReturnType [

	| paramCollectionType collectionType |
	paramCollectionType := (self create: CSNBuCollectionType) yourself.
	collectionType := self create: CSNBuBusinessType.
	paramCollectionType type: collectionType.
	serviceAPI dataType: collectionType.
	self assert: (serviceAPI dependencies includes: collectionType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesInParam [

	| paramType |
	paramType := (self create: CSNBuBusinessType) yourself.
	serviceAPI addParameter:
		((self create: CSNServiceAPIParameter) dataType: paramType).
	self assert: (serviceAPI dependencies includes: paramType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesInParamCollection [

	| paramCollectionType collectionType |
	paramCollectionType := (self create: CSNBuCollectionType) yourself.
	collectionType := self create: CSNBuBusinessType.
	paramCollectionType type: collectionType.
	serviceAPI addParameter:
		((self create: CSNServiceAPIParameter) dataType: paramCollectionType).
	self assert: (serviceAPI dependencies includes: collectionType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesInParamCollectionNotBusiness [

	| paramCollectionType collectionType |
	paramCollectionType := (self create: CSNBuCollectionType) yourself.
	collectionType := self create: CSNBuDTO.
	paramCollectionType type: collectionType.
	serviceAPI addParameter:
		((self create: CSNServiceAPIParameter) dataType: paramCollectionType).
	self deny: (serviceAPI dependencies includes: collectionType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesInParamCollectionOfCollection [

	| paramCollectionType paramCollectionCollectionType collectionType |
	paramCollectionType := (self create: CSNBuCollectionType) yourself.
	paramCollectionCollectionType := (self create: CSNBuCollectionType) yourself.
	collectionType := self create: CSNBuBusinessType.
	paramCollectionType type: paramCollectionCollectionType.
	paramCollectionCollectionType type: collectionType.
	serviceAPI addParameter:
		((self create: CSNServiceAPIParameter) dataType: paramCollectionType).
	self assert: (serviceAPI dependencies includes: collectionType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesInParamCollectionOfCollectionNotBusiness [

	| paramCollectionType paramCollectionCollectionType collectionType |
	paramCollectionType := (self create: CSNBuCollectionType) yourself.
	paramCollectionCollectionType := (self create: CSNBuCollectionType) yourself.
	collectionType := self create: CSNBuDTO.
	paramCollectionType type: paramCollectionCollectionType.
	paramCollectionCollectionType type: collectionType.
	serviceAPI addParameter:
		((self create: CSNServiceAPIParameter) dataType: paramCollectionType).
	self deny: (serviceAPI dependencies includes: collectionType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesInParamNotBusiness [

	| paramType |
	paramType := (self create: CSNBuDTO) yourself.
	serviceAPI addParameter:
		((self create: CSNServiceAPIParameter) dataType: paramType).
	self deny: (serviceAPI dependencies includes: paramType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesReturnType [

	| returnType |
	returnType := (self create: CSNBuBusinessType)
		              name: 'returnType';
		              yourself.
	serviceAPI dataType: returnType.
	self assert: (serviceAPI dependencies includes: returnType)
]

{ #category : #tests }
CSNServiceAPITest >> testDependenciesReturnTypeNotBusiness [

	| returnType |
	returnType := (self create: CSNBuDTO) yourself.
	serviceAPI dataType: returnType.
	self deny: (serviceAPI dependencies includes: returnType)
]

{ #category : #test }
CSNServiceAPITest >> testPrintCreateFormDataIn [

	| result expected |
	result := String streamContents: [ :stream | 
		          serviceAPI printCreateFormDataIn: stream ].
	expected := String crlf join:
		            #( '' 'const formData = new FormData();' '' ).
	self assert: result equals: expected
]

{ #category : #test }
CSNServiceAPITest >> testPrintCreateFormDataInWithBusinessParam [

	| result expected paramType exporter |
	paramType := (self create: CSNBuBusinessType) name:
		             'businessType' yourself.
	serviceAPI addParameter: ((self create: CSNServiceAPIParameter)
			 name: paramType name;
			 dataType: paramType;
			 yourself).

	exporter := CSNModelExporterAngularBLSpecific new.
	result := String streamContents: [ :stream | 
		          exporter currentWriteStream: stream.
		          serviceAPI printCreateFormDataIn: exporter ].
	expected := String crlf join:
		            #( '' 'const formData = new FormData();'
		               'formData.append(''business-type'', JSON.stringify(businessType));' ).
	self assert: result equals: expected
]
