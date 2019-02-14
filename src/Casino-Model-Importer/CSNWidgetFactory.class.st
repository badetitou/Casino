Class {
	#name : #CSNWidgetFactory,
	#superclass : #Object,
	#instVars : [
		'model',
		'importer'
	],
	#category : #'Casino-Model-Importer'
}

{ #category : #accessing }
CSNWidgetFactory >> importer: anObject [
	importer := anObject
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
CSNWidgetFactory >> uiModel [
	^ importer
]
