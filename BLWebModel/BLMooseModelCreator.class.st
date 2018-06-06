Class {
	#name : #BLMooseModelCreator,
	#superclass : #Object,
	#instVars : [
		'model',
		'blApplication'
	],
	#category : 'BLWebModel'
}

{ #category : #running }
BLMooseModelCreator class >> runOn: aModel from: aBlApplication [
	^ self new
		model: aModel;
		blApplication: aBlApplication;
		basicRun;
		model
]

{ #category : #accessing }
BLMooseModelCreator >> basicRun [
	self modelKind new createModelIn: model from: blApplication.
	model install
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
	^ BLWebModel 
	
]
