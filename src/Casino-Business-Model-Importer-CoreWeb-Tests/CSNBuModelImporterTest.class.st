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
	^ FAMIXModel new
]

{ #category : #running }
CSNBuModelImporterTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	buModelImporter := CSNBuModelImporter new.
	buModelImporter famixModel: FAMIXModel new.
	self famixModel.
	buModelImporter buModel: CSNBuModel new.
]

{ #category : #test }
CSNBuModelImporterTest >> testImportClass [
	| sourceClass |
	sourceClass := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessType'.
	buModelImporter importClass: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 1.
]

{ #category : #test }
CSNBuModelImporterTest >> testImportClassTwice [
	| sourceClass |
	sourceClass := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessType'.
	buModelImporter importClass: sourceClass.
	buModelImporter importClass: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 1.
]

{ #category : #test }
CSNBuModelImporterTest >> testImportCollectionType [
	| sourceClass argument |
	sourceClass := (self createInFamixModel: FAMIXParameterizedType)
		name: 'List'.
	argument := (self createInFamixModel: FAMIXPrimitiveType) name: 'int'.
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

{ #category : #test }
CSNBuModelImporterTest >> testImportCollectionTypeWithoutArgument [
	| sourceClass |
	sourceClass := (self createInFamixModel: FAMIXParameterizedType)
		name: 'List'.
	buModelImporter importCollectionType: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuCollectionType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDTO) size
		equals: 1
]

{ #category : #test }
CSNBuModelImporterTest >> testImportDictionaryType [
	| sourceClass argument argument2 |
	sourceClass := (self createInFamixModel: FAMIXParameterizedType)
		name: 'Map'.
	argument := (self createInFamixModel: FAMIXPrimitiveType) name: 'int'.
	argument2 := (self createInFamixModel: FAMIXPrimitiveType)
		name: 'long'.
	sourceClass addArgument: argument.
	sourceClass addArgument: argument2.
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

{ #category : #test }
CSNBuModelImporterTest >> testImportDictionaryTypeWithoutArgument [
	| sourceClass |
	sourceClass := (self createInFamixModel: FAMIXParameterizedType)
		name: 'Map'.
	buModelImporter importDictionaryType: sourceClass.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDictionaryType) size
		equals: 0.
	self
		assert: (buModelImporter buModel allWithType: CSNBuDTO) size
		equals: 1
]

{ #category : #test }
CSNBuModelImporterTest >> testImportIntPrimitiveType [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FAMIXPrimitiveType)
		name: 'int'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne name equals: #int
]

{ #category : #test }
CSNBuModelImporterTest >> testImportLongPrimitiveType [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FAMIXPrimitiveType)
		name: 'long'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) anyOne name equals: #long
]

{ #category : #test }
CSNBuModelImporterTest >> testImportPrimitiveType [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FAMIXPrimitiveType)
		name: 'int'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	buModelImporter importPrimitiveType: sourceClass.
	buModelImporter buModel resetPrivateState.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1
]

{ #category : #test }
CSNBuModelImporterTest >> testImportPrimitiveTypeOnlyOneCreated [
	| sourceClass |
		"test that we can import an int"
	sourceClass := (self createInFamixModel: FAMIXPrimitiveType)
		name: 'int'.
	buModelImporter importPrimitiveType: sourceClass.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1.
	buModelImporter importPrimitiveType: sourceClass.
	buModelImporter buModel resetPrivateState.
	self assert: (buModelImporter buModel allWithType: CSNBuPrimitive) size equals: 1
]

{ #category : #test }
CSNBuModelImporterTest >> testImportSeveralClasses [
	| sourceClass sourceClassA sourceClassB |
	sourceClass := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessType'.
	sourceClassA := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessTypeA'.
	sourceClassB := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessTypeB'.
	buModelImporter importClass: sourceClass.
	buModelImporter importClass: sourceClassA.
	buModelImporter importClass: sourceClassB.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 3
]

{ #category : #test }
CSNBuModelImporterTest >> testImportSeveralClassesWithDuplicate [
	| sourceClass sourceClassA sourceClassB |
	sourceClass := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessType'.
	sourceClassA := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessType'.
	sourceClassB := (self createInFamixModel: FAMIXClass)
		name: 'aBusinessTypeB'.
	buModelImporter importClass: sourceClass.
	buModelImporter importClass: sourceClassA.
	buModelImporter importClass: sourceClassB.
	self
		assert: (buModelImporter buModel allWithType: CSNBuBusinessType) size
		equals: 2
]

{ #category : #test }
CSNBuModelImporterTest >> testVisitClass [
	"default is the class is a business class"

	| abstractClass businessClassA |
	abstractClass := (self createInFamixModel: FAMIXClass)
		name: buModelImporter dtoAbstractName;
		yourself.
	businessClassA := (self createInFamixModel: FAMIXClass)
		name: 'businessClassA';
		yourself.
	(self createInFamixModel: FAMIXInheritance)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassBoolean [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassByte [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassDate [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassDouble [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassFloat [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassInteger [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassLong [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassString [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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

{ #category : #test }
CSNBuModelImporterTest >> testVisitClassUnknow [
	"default is the class is a business class"

	| stringClass |
	stringClass := (self createInFamixModel: FAMIXClass)
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
