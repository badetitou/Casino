Class {
	#name : #BLUIWidth,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIWidth >> accept: anExporter [
	^ anExporter visitBLUIWidth: self
]

{ #category : #accessing }
BLUIWidth >> text [
	<MSEProperty: #width type: #String>
	^ text
]

{ #category : #accessing }
BLUIWidth >> text: anObject [
	text := anObject
]
