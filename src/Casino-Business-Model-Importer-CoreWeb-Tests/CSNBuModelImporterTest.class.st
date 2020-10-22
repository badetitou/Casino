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

{ #category : #testing }
CSNBuModelImporterTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #CSNBuModelImporterTest
]

{ #category : #running }
CSNBuModelImporterTest >> createInFamixModel: aClass [
	^ buModelImporter famixModel add: aClass new
]

{ #category : #running }
CSNBuModelImporterTest >> famixModel [
	self subclassResponsibility
]

{ #category : #running }
CSNBuModelImporterTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	buModelImporter := CSNBuModelImporter new.
	buModelImporter famixModel: FAMIXModel new.
	self famixModel.
	buModelImporter buModel: CSNBuModel new.
	buModelImporter import
]
