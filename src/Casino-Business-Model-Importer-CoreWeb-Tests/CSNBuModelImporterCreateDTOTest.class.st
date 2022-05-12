"
This class contains tests for the following imported class

class BusinessClassA extends AbstractPersistentObjectGWT { 
	int aPrimitiveIntParameter;
}
"
Class {
	#name : #CSNBuModelImporterCreateDTOTest,
	#superclass : #TestCase,
	#instVars : [
		'buModelImporter',
		'famixModel'
	],
	#category : #'Casino-Business-Model-Importer-CoreWeb-Tests'
}

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> createInFamixModel: aClass [
	^ buModelImporter famixModel add: aClass new
]

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> famixModel [
	| model abstractClass businessClassA integerPrimitiveType |
	model := FamixJavaModel new.
	abstractClass := (self createInFamixModel: FamixJavaClass)
		name: buModelImporter dtoAbstractName;
		yourself.
	businessClassA := (self createInFamixModel: FamixJavaClass)
		name: 'businessClassA';
		yourself.
	(self createInFamixModel: FamixJavaInheritance)
		superclass: abstractClass;
		subclass: businessClassA.
		
	integerPrimitiveType := (self createInFamixModel: FamixJavaPrimitiveType)
		name: 'int'.

	(self createInFamixModel: FamixJavaAttribute)
		name: 'aPrimitiveIntParameter';
		parentType: businessClassA;
		declaredType: integerPrimitiveType.

	^ model
]

{ #category : #running }
CSNBuModelImporterCreateDTOTest >> setUp [
	super setUp.
	buModelImporter := CSNBuModelImporter new.
	buModelImporter famixModel: FamixJavaModel new.
	self famixModel.
	buModelImporter buModel: CSNBuModel new.
	buModelImporter import
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
