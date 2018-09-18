Class {
	#name : #BLUIName,
	#superclass : #BLAttribute,
	#instVars : [
		'nameValue'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIName >> accept: anExporter [
	^ anExporter visitBLUIName: self
]

{ #category : #accessing }
BLUIName >> nameValue [
	^ nameValue
]

{ #category : #accessing }
BLUIName >> nameValue: anObject [
	nameValue := anObject
]
