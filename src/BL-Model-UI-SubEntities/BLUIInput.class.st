Class {
	#name : #BLUIInput,
	#superclass : #BLUIContainer,
	#instVars : [
		'value',
		'text'
	],
	#category : #'BL-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
BLUIInput class >> annotation [
	<MSEClass: #BLUIInput super: #BLUIContainer>
	<package: #BLWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
BLUIInput >> accept: anExporter [
	^ anExporter visitBLUIInput: self
]

{ #category : #accessing }
BLUIInput >> text [
	^ text
]

{ #category : #accessing }
BLUIInput >> text: anObject [
	text := anObject
]

{ #category : #accessing }
BLUIInput >> value1 [
	^ value
]

{ #category : #accessing }
BLUIInput >> value: anObject [
	value := anObject
]
