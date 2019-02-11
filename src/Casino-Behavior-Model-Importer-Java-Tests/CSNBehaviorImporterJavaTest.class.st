Class {
	#name : #CSNBehaviorImporterJavaTest,
	#superclass : #TestCase,
	#instVars : [
		'model'
	],
	#category : #'Casino-Behavior-Model-Importer-Java-Tests'
}

{ #category : #running }
CSNBehaviorImporterJavaTest >> setUp [
	model := MooseModel new
		metamodel:
			(MooseModel
				metamodelComposedOf:
					{FASTJavaMetamodelGenerator metamodel.
					CSNBehaviorModelGenerator metamodel});
		yourself.
	
]
