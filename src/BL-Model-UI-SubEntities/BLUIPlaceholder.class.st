Class {
	#name : #BLUIPlaceholder,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIPlaceholder >> accept: anExporter [
	^ anExporter visitBLUIPlaceholder: self
]

{ #category : #accessing }
BLUIPlaceholder >> text [
	^ text
]

{ #category : #accessing }
BLUIPlaceholder >> text: anObject [
	text := anObject
]
