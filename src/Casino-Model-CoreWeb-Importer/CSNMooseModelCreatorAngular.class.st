Class {
	#name : #CSNMooseModelCreatorAngular,
	#superclass : #CSNMooseModelCreator,
	#instVars : [
		'xml',
		'sourceModel'
	],
	#category : #'Casino-Model-CoreWeb-Importer'
}

{ #category : #running }
CSNMooseModelCreatorAngular class >> runOn: aModel from: aBlApplication with: xml sourceModel: sourceModel [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		sourceModel: sourceModel;
		xml: xml;
		basicRun;
		model
]

{ #category : #running }
CSNMooseModelCreatorAngular class >> runOn: aModel fromSourceModel: sourceModel and: xml [
	^ self new
		model: aModel;
		sourceModel: sourceModel;
		xml: xml;
		basicRun;
		model
]

{ #category : #run }
CSNMooseModelCreatorAngular >> basicRun [
	self modelKind new
		xml: (PPXmlParser parse: xml asFileReference contents);
		sourceModel: sourceModel;
		createModelIn: model.
]

{ #category : #accessing }
CSNMooseModelCreatorAngular >> modelKind [
	^ CSNWebModelJava
]

{ #category : #accessing }
CSNMooseModelCreatorAngular >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
CSNMooseModelCreatorAngular >> sourceModel: anObject [
	sourceModel := anObject
]

{ #category : #accessing }
CSNMooseModelCreatorAngular >> xml [
	^ xml
]

{ #category : #accessing }
CSNMooseModelCreatorAngular >> xml: anObject [
	xml := anObject
]
