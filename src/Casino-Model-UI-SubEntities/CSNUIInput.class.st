Class {
	#name : #CSNUIInput,
	#superclass : #CSNUILeaf,
	#instVars : [
		'value'
	],
	#category : #'Casino-Model-UI-SubEntities-Widgets'
}

{ #category : #meta }
CSNUIInput class >> annotation [
	<MSEClass: #CSNUIInput super: #CSNUILeaf>
	<package: #CSNWebModelJava>
	^ self
]

{ #category : #'as yet unclassified' }
CSNUIInput >> accept: anExporter [
	^ anExporter visitUIInput: self
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
CSNUIInput >> value1 [
	^ value
]

{ #category : #accessing }
CSNUIInput >> value: anObject [
	value := anObject
]
