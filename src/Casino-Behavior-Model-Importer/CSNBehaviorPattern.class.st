Class {
	#name : #CSNBehaviorPattern,
	#superclass : #Object,
	#instVars : [
		'model',
		'modelImporter'
	],
	#category : #'Casino-Behavior-Model-Importer'
}

{ #category : #'instance creation' }
CSNBehaviorPattern class >> on: model [
	^ self new model: model
]

{ #category : #'instance creation' }
CSNBehaviorPattern class >> on: model from: aBehavioralModelImporter [
	^ self new model: model; modelImporter: aBehavioralModelImporter 
]

{ #category : #accessing }
CSNBehaviorPattern >> model [
	^ model
]

{ #category : #accessing }
CSNBehaviorPattern >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CSNBehaviorPattern >> modelImporter [
	^ modelImporter
]

{ #category : #accessing }
CSNBehaviorPattern >> modelImporter: anObject [
	modelImporter := anObject
]

{ #category : #running }
CSNBehaviorPattern >> run [
	self subclassResponsibility
]
