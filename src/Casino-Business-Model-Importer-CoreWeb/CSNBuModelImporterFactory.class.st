Class {
	#name : #CSNBuModelImporterFactory,
	#superclass : #Object,
	#instVars : [
		'model'
	],
	#category : #'Casino-Business-Model-Importer-CoreWeb'
}

{ #category : #evaluating }
CSNBuModelImporterFactory class >> in: aModelInWhichCreateElement [
	^ self new
		model: aModelInWhichCreateElement;
		yourself
]

{ #category : #creating }
CSNBuModelImporterFactory >> create: aCSNBuClass [
	^ self model add: aCSNBuClass new
]

{ #category : #accessing }
CSNBuModelImporterFactory >> model [
	^ model
]

{ #category : #accessing }
CSNBuModelImporterFactory >> model: anObject [
	model := anObject
]
