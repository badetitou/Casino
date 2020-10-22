"
This class contains tests for the following imported class

class BusinessClassA extends AbstractPersistentObjectGWT { 
	int aPrimitiveIntParameter;
}
"
Class {
	#name : #CSNBuModelImporterCreateDTOTest,
	#superclass : #CSNBuModelImporterTest,
	#category : #'Casino-Business-Model-Importer-CoreWeb-Tests'
}

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> famixModel [
	| model abstractClass businessClassA integerPrimitiveType |
	model := FAMIXModel new.
	abstractClass := (self createInFamixModel: FAMIXClass)
		name: buModelImporter dtoAbstractName;
		yourself.
	businessClassA := (self createInFamixModel: FAMIXClass)
		name: 'businessClassA';
		yourself.
	(self createInFamixModel: FAMIXInheritance)
		superclass: abstractClass;
		subclass: businessClassA.
		
	integerPrimitiveType := (self createInFamixModel: FAMIXPrimitiveType)
		name: 'int'.

	(self createInFamixModel: FAMIXAttribute)
		name: 'aPrimitiveIntParameter';
		parentType: businessClassA;
		declaredType: integerPrimitiveType.

	^ model
]

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> testCanImportBusinessClassA [
	self assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size equals: 1.
]

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> testCanImportOneAttribute [
	self assert: (buModelImporter buModel allWithType: CSNBuAttribute) size equals: 1.
]

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> testIntegerAttributeIsBuPrimitiveInt [
	self assert: (buModelImporter buModel allWithType: CSNBuAttribute) anyOne attributeType class equals: CSNBuPrimitive.
	self assert: (buModelImporter buModel allWithType: CSNBuAttribute) anyOne attributeType name equals: 'int'
]
