Class {
	#name : #BLUIDisabled,
	#superclass : #BLAttribute,
	#instVars : [
		'disabled'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIDisabled >> accept: anExporter [
	^ anExporter visitBLUIDisabled: self
]

{ #category : #accessing }
BLUIDisabled >> disabled [
	^ disabled
]

{ #category : #accessing }
BLUIDisabled >> disabled: anObject [
	disabled := anObject
]
