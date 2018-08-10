Class {
	#name : #BLGridSubElement,
	#superclass : #BLNormalAttribute,
	#instVars : [
		'subpart'
	],
	#category : #'BL-Model-CoreWeb-Attribute'
}

{ #category : #accessing }
BLGridSubElement >> attributeValue [
	^ 'ui-g-', self subpart asString
]

{ #category : #accessing }
BLGridSubElement >> name [
	^ 'class'
]

{ #category : #accessing }
BLGridSubElement >> subpart [
	"I represent the number 12 divided by the number widget at my level"

	^ subpart
]

{ #category : #accessing }
BLGridSubElement >> subpart: anObject [
	anObject < 1
		ifTrue: [ subpart := 1 ]
		ifFalse: [ subpart := anObject floor ]
]
