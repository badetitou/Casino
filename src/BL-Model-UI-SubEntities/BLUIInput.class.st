Class {
	#name : #BLUIInput,
	#superclass : #BLUIContainer,
	#instVars : [
		'text',
		'value',
		'readonly',
		'disabled',
		'placeholder'
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
BLUIInput >> disabled [
	^ disabled
]

{ #category : #accessing }
BLUIInput >> disabled: anObject [
	disabled := anObject
]

{ #category : #accessing }
BLUIInput >> placeholder [
	^ placeholder
]

{ #category : #accessing }
BLUIInput >> placeholder: anObject [
	placeholder := anObject
]

{ #category : #accessing }
BLUIInput >> readonly [
	^ readonly
]

{ #category : #accessing }
BLUIInput >> readonly: anObject [
	readonly := anObject
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
