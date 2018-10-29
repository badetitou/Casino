Class {
	#name : #BLWidgetFactory,
	#superclass : #Object,
	#instVars : [
		'model',
		'importer'
	],
	#category : #'BL-Model-Importer'
}

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
