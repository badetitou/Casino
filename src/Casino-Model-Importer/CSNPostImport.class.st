Class {
	#name : #CSNPostImport,
	#superclass : #Object,
	#instVars : [
		'importer'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #accessing }
CSNPostImport >> importer [

	^ importer
]

{ #category : #accessing }
CSNPostImport >> importer: anObject [

	importer := anObject
]

{ #category : #running }
CSNPostImport >> runFromImporter: aCSNImporter [
	self subclassResponsibility 
]
