Class {
	#name : #CSNBehaviorImporterJavaTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #testing }
CSNBehaviorImporterJavaTest class >> isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"

	^self name = #CSNBehaviorImporterJavaTest
]

{ #category : #running }
CSNBehaviorImporterJavaTest >> setUp [
	super setUp.
	model := MooseModel new
		metamodel:
			(MooseModel
				metamodelComposedOf:
					{FASTJavaMetamodelGenerator metamodel.
					CSNBehaviorModelGenerator metamodel.
					CSNLayoutMetamodelGenerator metamodel});
		yourself.
	
]
