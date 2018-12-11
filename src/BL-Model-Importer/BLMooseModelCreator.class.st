Class {
	#name : #BLMooseModelCreator,
	#superclass : #Object,
	#instVars : [
		'model',
		'blApplication'
	],
	#category : 'BL-Model-Importer'
}

{ #category : #running }
BLMooseModelCreator class >> runOn: aModel from: aBlApplication [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		basicRun;
		model
]

{ #category : #running }
BLMooseModelCreator class >> runOn: aModel from: aBlApplication with: xml [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		xml: xml;
		basicRun;
		model
]

{ #category : #run }
BLMooseModelCreator >> basicRun [
	self modelKind new createModelIn: model.
]

{ #category : #accessing }
BLMooseModelCreator >> blApplication [
	^ blApplication
]

{ #category : #accessing }
BLMooseModelCreator >> blApplication: anObject [
	blApplication := anObject
]

{ #category : #accessing }
BLMooseModelCreator >> model [
	^ model
]

{ #category : #accessing }
BLMooseModelCreator >> model: aModel [
	model := aModel
]

{ #category : #accessing }
BLMooseModelCreator >> modelKind [
	self subclassResponsibility 
]
