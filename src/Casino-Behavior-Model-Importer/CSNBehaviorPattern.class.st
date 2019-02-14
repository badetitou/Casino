Class {
	#name : #CSNBehaviorPattern,
	#superclass : #Object,
	#instVars : [
		'model',
		'uiModel'
	],
	#category : #'Casino-Behavior-Model-Importer'
}

{ #category : #'instance creation' }
CSNBehaviorPattern class >> on: model [
	^ self on: model fromUiModel: nil
]

{ #category : #'instance creation' }
CSNBehaviorPattern class >> on: model from: aBehavioralModelImporter [
	^ self on: model fromUiModel: aBehavioralModelImporter uiModel
]

{ #category : #'instance creation' }
CSNBehaviorPattern class >> on: model fromUiModel: aUiModel [
	^ self new model: model; uiModel: aUiModel 
]

{ #category : #accessing }
CSNBehaviorPattern >> model [
	^ model
]

{ #category : #accessing }
CSNBehaviorPattern >> model: anObject [
	model := anObject
]

{ #category : #running }
CSNBehaviorPattern >> run [
	self subclassResponsibility
]

{ #category : #accessing }
CSNBehaviorPattern >> uiModel [
	^ uiModel
]

{ #category : #accessing }
CSNBehaviorPattern >> uiModel: anObject [
	uiModel := anObject
]
