"
A CSNWebModelJavaTest is a test class for testing the behavior of CSNWebModelJava
"
Class {
	#name : #CSNWebModelJavaTest,
	#superclass : #TestCase,
	#instVars : [
		'uiImporter'
	],
	#category : #'Casino-Model-CoreWeb-Importer-Tests'
}

{ #category : #setUp }
CSNWebModelJavaTest >> setUp [
	super setUp.
	uiImporter := CSNWebModelJava new.
	uiImporter sourceModel: FAMIXModel new.
	uiImporter model: CSNUICWModel new.
	uiImporter preImport
]
