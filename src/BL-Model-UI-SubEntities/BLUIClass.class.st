Class {
	#name : #BLUIClass,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIClass >> accept: anExporter [
	^ anExporter visitBLUIClass: self
]

{ #category : #accessing }
BLUIClass >> text [
	^ text
]

{ #category : #accessing }
BLUIClass >> text: anObject [
	text := anObject
]
