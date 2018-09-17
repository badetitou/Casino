Class {
	#name : #BLUIValue,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIValue >> accept: anExporter [
	^ anExporter visitBLUIValue: self
]

{ #category : #accessing }
BLUIValue >> text [
	^ text
]

{ #category : #accessing }
BLUIValue >> text: anObject [
	text := anObject
]
