Class {
	#name : #CSNWebModel,
	#superclass : #Object,
	#instVars : [
		'model',
		'sourceModel',
		'factory'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #accessing }
CSNWebModel class >> webRoot [
	"I represent the root of URL"
	^ 'http://ap15mogbl:8080/Web_coreincubator/coreincubator/skins/e-sedit/'
]

{ #category : #initialization }
CSNWebModel >> createFactory [
]

{ #category : #private }
CSNWebModel >> createModelIn: aModel [
	model := aModel.
	self preImport.
	self import.
	self postImport.
	
]

{ #category : #accessing }
CSNWebModel >> factory [
	^ factory
]

{ #category : #accessing }
CSNWebModel >> factoryCreateWidgetFrom: anObject [
	^ self factory createWidgetFrom: anObject 
]

{ #category : #api }
CSNWebModel >> import [
	self subclassResponsibility 
]

{ #category : #accessing }
CSNWebModel >> model [
	^ model
]

{ #category : #accessing }
CSNWebModel >> model: anObject [
	model := anObject
]

{ #category : #api }
CSNWebModel >> postImport [
	
]

{ #category : #api }
CSNWebModel >> preImport [
	self createFactory
]

{ #category : #accessing }
CSNWebModel >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
CSNWebModel >> sourceModel: anObject [
	sourceModel := anObject
]
