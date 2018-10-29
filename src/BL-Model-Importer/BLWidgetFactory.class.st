Class {
	#name : #BLWidgetFactory,
	#superclass : #Object,
	#instVars : [
		'model',
		'importer'
	],
	#category : #'BL-Model-Importer'
}

{ #category : #factory }
BLWidgetFactory >> createAttributeFrom: anObject [
	^ self subclassResponsibility
]

{ #category : #factory }
BLWidgetFactory >> createWidgetFrom: anObject [
	^ self subclassResponsibility
]

{ #category : #accessing }
BLWidgetFactory >> importer [
	^ importer
]

{ #category : #accessing }
BLWidgetFactory >> importer: anObject [
	importer := anObject
]

{ #category : #accessing }
BLWidgetFactory >> model [
	^ model
]

{ #category : #accessing }
BLWidgetFactory >> model: anObject [
	model := anObject
]
