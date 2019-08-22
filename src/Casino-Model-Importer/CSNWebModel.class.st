"
I'm the abstract Importer of CasinI 

At least extends import
we can extend 
	#createFactory if you want you're own
	#preImport to execute some code before the import
	#postImport to execute some code after the import
"
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
	^ 'http://ap15mogbl:8080/Web_coreincubator/coreincubator/'
]

{ #category : #accessing }
CSNWebModel class >> webSkinRoot [
	"I represent the root of URL"
	^ self webRoot , 'skins/e-sedit/'
]

{ #category : #initialization }
CSNWebModel >> createFactory [
	factory := self factoryClass new model: model; importer: self; yourself 
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

{ #category : #initialization }
CSNWebModel >> factoryClass [
	^ CSNWidgetFactory
]

{ #category : #accessing }
CSNWebModel >> factoryCreateWidgetFrom: anObject [
	^ self factory createWidgetFor: anObject withParent: nil 
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
