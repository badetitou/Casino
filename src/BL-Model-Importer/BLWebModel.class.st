Class {
	#name : #BLWebModel,
	#superclass : #Object,
	#instVars : [
		'model',
		'sourceModel'
	],
	#category : 'BL-Model-Importer'
}

{ #category : #'as yet unclassified' }
BLWebModel class >> webRoot [
	"I represent the root of URL"
	^ 'http://ap15mogbl:8080/Web_coreincubator/coreincubator/skins/e-sedit/'
]

{ #category : #private }
BLWebModel >> createModelIn: aModel [
	model := aModel.
	self preImport.
	self import.
	self postImport.
	
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
	
]

{ #category : #accessing }
BLWebModel >> sourceModel [
	^ sourceModel
]

{ #category : #accessing }
BLWebModel >> sourceModel: anObject [
	sourceModel := anObject
]
