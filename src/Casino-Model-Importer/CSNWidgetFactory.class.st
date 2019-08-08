Class {
	#name : #CSNWidgetFactory,
	#superclass : #Object,
	#instVars : [
		'model',
		'importer',
		'visitorImporters'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #creating }
CSNWidgetFactory >> addVisitorImporter: aVisitorImporter [
	self visitorImporters add: (aVisitorImporter factory: self; yourself)
]

{ #category : #accessing }
CSNWidgetFactory >> create: anEntity [
	"Use me to create an entity and add it direclty in the model
	
	If you use only me, we're sure to not forget adding entities in the model"
	^ self model add: anEntity new
]

{ #category : #creating }
CSNWidgetFactory >> createAttributeFor: aWidget from: anElement [
	^ CSNAttribute newFrom: anElement for: aWidget withImporters: visitorImporters
]

{ #category : #'as yet unclassified' }
CSNWidgetFactory >> createWidgetFor: theWidgetSource withParent: parent [
	^ (CSNWidget newFrom: theWidgetSource for: parent withImporters: visitorImporters) ifNil: [ self create: CSNContainer ]
]

{ #category : #accessing }
CSNWidgetFactory >> importer [
	^ importer
]

{ #category : #accessing }
CSNWidgetFactory >> importer: anObject [
	importer := anObject
]

{ #category : #initialization }
CSNWidgetFactory >> initialize [
	super initialize.
	visitorImporters := OrderedCollection new.
]

{ #category : #accessing }
CSNWidgetFactory >> model [
	^ model
]

{ #category : #accessing }
CSNWidgetFactory >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CSNWidgetFactory >> visitorImporters [
	^ visitorImporters
]

{ #category : #accessing }
CSNWidgetFactory >> visitorImporters: anObject [
	visitorImporters := anObject
]
