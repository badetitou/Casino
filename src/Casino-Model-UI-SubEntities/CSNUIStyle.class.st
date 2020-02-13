Class {
	#name : #CSNUIStyle,
	#superclass : #CSNAttribute,
	#instVars : [
		'styleAttribute',
		'styleAttributeValue'
	],
	#category : #'Casino-Model-UI-SubEntities-Attributes'
}

{ #category : #meta }
CSNUIStyle class >> annotation [

	<FMClass: #Style super: #CSNAttribute>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
	^self
]

{ #category : #accessing }
CSNUIStyle >> styleAttribute [
	^ styleAttribute
]

{ #category : #accessing }
CSNUIStyle >> styleAttribute: anObject [
	styleAttribute := anObject
]

{ #category : #accessing }
CSNUIStyle >> styleAttributeValue [
	^ styleAttributeValue
]

{ #category : #accessing }
CSNUIStyle >> styleAttributeValue: anObject [
	styleAttributeValue := anObject
]
