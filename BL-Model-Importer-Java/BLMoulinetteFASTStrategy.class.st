"
I use FAST to convert the work code
"
Class {
	#name : #BLMoulinetteFASTStrategy,
	#superclass : #BLMoulinetteStrategy,
	#instVars : [
		'fastImporter'
	],
	#category : 'BL-Model-Importer-Java'
}

{ #category : #'as yet unclassified' }
BLMoulinetteFASTStrategy >> convertFAMIXClassToCodeMetierModel: aFAMIXClass [
	^ aFAMIXClass methods
		collect: [ :aFamixMethod |  self fastImporter parseTreeForSource: aFamixMethod  sourceText ].
]

{ #category : #accessing }
BLMoulinetteFASTStrategy >> fastImporter [
	^ fastImporter 
]

{ #category : #accessing }
BLMoulinetteFASTStrategy >> fastImporter: aFastImporter [
	fastImporter := aFastImporter 
]

{ #category : #initialization }
BLMoulinetteFASTStrategy >> initialize [
	super initialize.
	fastImporter := FASTJavaImporterVisitor new
]
