"
I correspond to the text inside a Button or
beside a textInput
"
Class {
	#name : #BLUILabel,
	#superclass : #BLAttribute,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUILabel >> accept: anExporter [
	^ anExporter visitBLUILabel: self
]

{ #category : #accessing }
BLUILabel >> text [
	^ text
]

{ #category : #accessing }
BLUILabel >> text: anObject [
	text := anObject
]
