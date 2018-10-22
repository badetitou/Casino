Class {
	#name : #BLWebModel,
	#superclass : #Object,
	#instVars : [
		'model',
		'sourceModel',
		'factory'
	],
	#category : #'BL-Model-Importer'
}

{ #category : #accessing }
BLWebModel class >> webRoot [
	"I represent the root of URL"
	^ 'http://ap15mogbl:8080/Web_coreincubator/coreincubator/skins/e-sedit/'
]

{ #category : #accessing }
BLWebModel >> createFactory [
	self subclassResponsibility 
]

{ #category : #private }
BLWebModel >> createModelIn: aModel [
	model := aModel.
	self preImport.
	self import.
	self postImport.
	
]

{ #category : #accessing }
BLWebModel >> factory [
	^ factory
]

{ #category : #accessing }
BLWebModel >> factoryCreateWidgetFrom: anObject [
	^ self factory createWidgetFrom: anObject 
]

{ #category : #api }
BLWebModel >> import [
	self subclassResponsibility 
]

{ #category : #accessing }
BLWebModel >> model [
	^ model
]

{ #category : #accessing }
BLWebModel >> model: anObject [
	model := anObject
]

{ #category : #api }
BLWebModel >> postImport [
	
]

{ #category : #api }
BLWebModel >> preImport [
	self createFactory
]

{ #category : #accessing }
BLWebModel >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
BLWebModel >> sourceModel: anObject [
	sourceModel := anObject
]
