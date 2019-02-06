Class {
	#name : #CSNMooseModelCreator,
	#superclass : #Object,
	#instVars : [
		'model',
		'blApplication'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #running }
CSNMooseModelCreator class >> runOn: aModel from: aBlApplication [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		basicRun;
		model
]

{ #category : #running }
CSNMooseModelCreator class >> runOn: aModel from: aBlApplication with: xml [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		xml: xml;
		basicRun;
		model
]

{ #category : #run }
CSNMooseModelCreator >> basicRun [
	self modelKind new createModelIn: model.
]

{ #category : #accessing }
CSNMooseModelCreator >> blApplication [
	^ blApplication
]

{ #category : #accessing }
CSNMooseModelCreator >> blApplication: anObject [
	blApplication := anObject
]

{ #category : #accessing }
CSNMooseModelCreator >> model [
	^ model
]

{ #category : #accessing }
CSNMooseModelCreator >> model: aModel [
	model := aModel
]

{ #category : #accessing }
CSNMooseModelCreator >> modelKind [
	self subclassResponsibility 
]
