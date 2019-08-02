Class {
	#name : #CSNUIInput,
	#superclass : #CSNLeaf,
	#instVars : [
		'value'
	],
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInput class >> annotation [

	<MSEClass: #Input super: #CSNLeaf>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIInput >> initialize [
	super initialize.
	value := ''.
	text := ''
]

{ #category : #accessing }
CSNUIInput >> text [
	^ text
]

{ #category : #accessing }
CSNUIInput >> text: anObject [
	text := anObject
]

{ #category : #accessing }
CSNUIInput >> value [

	<MSEProperty: #value type: #String>
	<generated>
	^ value
]

{ #category : #accessing }
CSNUIInput >> value1 [
	^ value
]

{ #category : #accessing }
CSNUIInput >> value: anObject [
	value := anObject
]
