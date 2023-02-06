"
I'm the abstract Importer of Casino

At least extends `#import`
we can extend

- `#createFactory` if you want you're own
- `#preImport` to execute some code before the import
- `#postImport` to execute some code after the import
"
Class {
	#name : #CSNWebModel,
	#superclass : #Object,
	#instVars : [
		'model',
		'sourceModel',
		'factory',
		'postImporters'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #accessing }
CSNWebModel >> addPostImporters: aPostImporter [

	postImporters add: aPostImporter
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
CSNWebModel >> initialize [
	super initialize.
	postImporters := OrderedCollection new
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

	self postImporters do: [ :postImporter | 
		postImporter runFromImporter: self ]
]

{ #category : #accessing }
CSNWebModel >> postImporters [

	^ postImporters
]

{ #category : #accessing }
CSNWebModel >> postImporters: anObject [

	postImporters := anObject
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

{ #category : #accessing }
CSNWebModel >> webSkinRoot [
	"I represent the root of URL"
	^ 'https://todo:8080/skins'
]
