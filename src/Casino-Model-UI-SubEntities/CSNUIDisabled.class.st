Class {
	#name : #CSNUIDisabled,
	#superclass : #CSNAttribute,
	#instVars : [
		'disabled'
	],
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
CSNUIDisabled >> accept: anExporter [
	^ anExporter visitUIDisabled: self
]

{ #category : #accessing }
CSNUIDisabled >> disabled [
	^ disabled
]

{ #category : #accessing }
CSNUIDisabled >> disabled: anObject [
	disabled := anObject
]
