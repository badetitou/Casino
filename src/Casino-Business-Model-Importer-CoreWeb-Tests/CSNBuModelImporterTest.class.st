"
A CSNBuModelImporterTest is a test class for testing the behavior of CSNBuModelImporter
"
Class {
	#name : #CSNBuModelImporterTest,
	#superclass : #TestCase,
	#instVars : [
		'buModelImporter',
		'famixModel'
	],
	#category : #'Casino-Business-Model-Importer-CoreWeb-Tests'
}

{ #category : #running }
CSNBuModelImporterTest >> createInFamixModel: aClass [
	^ buModelImporter famixModel add: aClass new
]

{ #category : #running }
CSNBuModelImporterTest >> famixModel [
	^ FamixJavaModel new
]

{ #category : #running }
CSNBuModelImporterTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	buModelImporter := CSNBuModelImporter new.
	buModelImporter famixModel: FamixJavaModel new.
	self famixModel.
	buModelImporter buModel: CSNBuModel new.
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportClass [
	| sourceClass |
	sourceClass := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessType'.
	buModelImporter importClass: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 1.
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportClassTwice [
	| sourceClass |
	sourceClass := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessType'.
	buModelImporter importClass: sourceClass.
	buModelImporter importClass: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 1.
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportCollectionType [
	| sourceClass argument |
	sourceClass := (self createInFamixModel: FamixJavaParameterizedType)
		name: 'List'.
	argument := (self createInFamixModel: FamixJavaPrimitiveType) name: 'int'.
	sourceClass addArgument: argument.
	buModelImporter importCollectionType: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuCollectionType) size
		equals: 1.
	self
		assert: (buModelImporter buModel allWithType: CSNBuCollectionType) anyOne type
		equals: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne name
		equals: #int
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportCollectionTypeWithoutArgument [

	| sourceClass |
	sourceClass := (self createInFamixModel: FamixJavaParameterizedType) 
		               name: 'List'.
	buModelImporter importCollectionType: sourceClass.
	self
		assert:
		(buModelImporter buModel allWithType: CSNBuCollectionType) size
		equals: 1.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDTO) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportDictionaryType [
	| sourceClass argument argument2 |
	sourceClass := (self createInFamixModel: FamixJavaParameterizedType)
		name: 'Map'.
	argument := (self createInFamixModel: FamixJavaPrimitiveType) name: 'int'.
	argument2 := (self createInFamixModel: FamixJavaPrimitiveType)
		name: 'long'.
	sourceClass addArgument: argument.
	sourceClass addArgument: argument2.
	
	"To satisfy temporary solution to find which parameter is key or value"
	sourceClass typedEntities: (Array with:
			 ((self createInFamixModel: FamixJavaAttribute) sourceAnchor:
				  ((self createInFamixModel: FamixJavaSourceTextAnchor)
					   source: 'Map<int, long> attr'))).
	
	buModelImporter importDictionaryType: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDictionaryType) size
		equals: 1.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDictionaryType) anyOne key
		equals:
			((buModelImporter buModel allWithType: CSNBuPrimitive)
				detect: [ :p | p name = #int ]).
	self
		assert: (buModelImporter buModel allWithType: CSNBuDictionaryType) anyOne value
		equals:
			((buModelImporter buModel allWithType: CSNBuPrimitive)
				detect: [ :p | p name = #long ]).
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 2
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportDictionaryTypeWithoutArgument [
	| sourceClass |
	sourceClass := (self createInFamixModel: FamixJavaParameterizedType)
		name: 'Map'.
	buModelImporter importDictionaryType: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDictionaryType) size
		equals: 1.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDTO) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportIntPrimitiveType [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FamixJavaPrimitiveType)
		name: 'int'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne name equals: #int
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportLongPrimitiveType [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FamixJavaPrimitiveType)
		name: 'long'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne name equals: #long
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportPrimitiveType [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FamixJavaPrimitiveType)
		name: 'int'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	buModelImporter importPrimitiveType: sourceClass.
	buModelImporter buModel resetPrivateState.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportPrimitiveTypeOnlyOneCreated [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FamixJavaPrimitiveType)
		name: 'int'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	buModelImporter importPrimitiveType: sourceClass.
	buModelImporter buModel resetPrivateState.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportSetType [

	| sourceClass argument |
	sourceClass := (self createInFamixModel: FamixJavaParameterizedType) 
		               name: 'Set'.
	argument := (self createInFamixModel: FamixJavaPrimitiveType) name:
		            'int'.
	sourceClass addArgument: argument.
	buModelImporter importCollectionType: sourceClass.
	self
		assert:
		(buModelImporter buModel allWithType: CSNBuCollectionType) size
		equals: 1.
	self
		assert:
		(buModelImporter buModel allWithType: CSNBuCollectionType) anyOne
			type
		equals: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne.
	self
		assert:
		(buModelImporter buModel allWithType: CSNBuPrimitive) anyOne name
		equals: #int
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportSetTypeWithoutArguments [

	| sourceClass |
	sourceClass := (self createInFamixModel: FamixJavaParameterizedType) 
		               name: 'Set'.
	buModelImporter importCollectionType: sourceClass.
	self
		assert:
		(buModelImporter buModel allWithType: CSNBuCollectionType) size
		equals: 1.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDTO) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportSeveralClasses [
	| sourceClass sourceClassA sourceClassB |
	sourceClass := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessType'.
	sourceClassA := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessTypeA'.
	sourceClassB := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessTypeB'.
	buModelImporter importClass: sourceClass.
	buModelImporter importClass: sourceClassA.
	buModelImporter importClass: sourceClassB.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 3
]

{ #category : #tests }
CSNBuModelImporterTest >> testImportSeveralClassesWithDuplicate [
	| sourceClass sourceClassA sourceClassB |
	sourceClass := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessType'.
	sourceClassA := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessType'.
	sourceClassB := (self createInFamixModel: FamixJavaClass)
		name: 'aBusinessTypeB'.
	buModelImporter importClass: sourceClass.
	buModelImporter importClass: sourceClassA.
	buModelImporter importClass: sourceClassB.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 2
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClass [
	"default is the class is a business class"

	| abstractClass businessClassA |
	abstractClass := (self createInFamixModel: FamixJavaClass)
		name: buModelImporter dtoAbstractNames first;
		yourself.
	businessClassA := (self createInFamixModel: FamixJavaClass)
		name: 'businessClassA';
		yourself.
	(self createInFamixModel: FamixJavaInheritance)
		superclass: abstractClass;
		subclass: businessClassA.
	buModelImporter visitClass: businessClassA.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 1.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) anyOne name
		equals: #businessClassA
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassBoolean [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Boolean;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassByte [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Byte;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassDate [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Date;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassDouble [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Double;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassFloat [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Float;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassInteger [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Integer;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassLong [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #Long;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassString [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #String;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 1
]

{ #category : #tests }
CSNBuModelImporterTest >> testVisitClassUnknow [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FamixJavaClass)
		name: #UnknowClass;
		yourself.
	buModelImporter visitClass: stringClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDTO) size
		equals: 1
]
