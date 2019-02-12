Class {
	#name : #CSNBehaviorPattern,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Casino-Behavior-Model-Importer'
}

{ #category : #'instance creation' }
CSNBehaviorPattern class >> on: model [
	^ self new model: model
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
