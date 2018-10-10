Class {
	#name : #BLMooseModelCreatorAngular,
	#superclass : #BLMooseModelCreator,
	#instVars : [
		'xml',
		'sourceModel'
	],
	#category : 'BL-Model-Importer-Java'
}

{ #category : #running }
BLMooseModelCreatorAngular class >> runOn: aModel from: aBlApplication with: xml [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		xml: xml;
		basicRun;
		model
]

{ #category : #running }
BLMooseModelCreatorAngular class >> runOn: aModel from: aBlApplication with: xml sourceModel: sourceModel [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		sourceModel: sourceModel;
		xml: xml;
		basicRun;
		model
]

{ #category : #running }
BLMooseModelCreatorAngular class >> runOn: aModel fromSourceModel: sourceModel and: xml [
	^ self new
		model: aModel;
		sourceModel: sourceModel;
		xml: xml;
		basicRun;
		model
]

{ #category : #accessing }
BLMooseModelCreatorAngular >> basicRun [
	self modelKind new
		xml: (PPXmlParser parse: xml asFileReference contents);
		sourceModel: sourceModel;
		createModelIn: model.
]

{ #category : #accessing }
BLMooseModelCreatorAngular >> modelKind [
	^ BLWebModelJava
]

{ #category : #accessing }
BLMooseModelCreatorAngular >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
BLMooseModelCreatorAngular >> sourceModel: anObject [
	sourceModel := anObject
]

{ #category : #accessing }
BLMooseModelCreatorAngular >> xml [
	^ xml
]

{ #category : #accessing }
BLMooseModelCreatorAngular >> xml: anObject [
	xml := anObject
]
