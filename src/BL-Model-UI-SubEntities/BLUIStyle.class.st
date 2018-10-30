Class {
	#name : #BLUIStyle,
	#superclass : #BLAttribute,
	#instVars : [
		'styleAttribute',
		'styleAttributeValue'
	],
	#category : #'BL-Model-UI-SubEntities-Attributes'
}

{ #category : #accessing }
BLUIStyle >> styleAttribute [
	^ styleAttribute
]

{ #category : #accessing }
BLUIStyle >> styleAttribute: anObject [
	styleAttribute := anObject
]

{ #category : #accessing }
BLUIStyle >> styleAttributeValue [
	^ styleAttributeValue
]

{ #category : #accessing }
BLUIStyle >> styleAttributeValue: anObject [
	styleAttributeValue := anObject
]
