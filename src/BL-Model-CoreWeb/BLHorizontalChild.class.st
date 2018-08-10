Class {
	#name : #BLHorizontalChild,
	#superclass : #BLNormalAttribute,
	#instVars : [
		'subpart'
	],
	#category : 'BL-Model-CoreWeb-Attribute'
}

{ #category : #accessing }
BLHorizontalChild >> subpart [
	"I represent the number 12 divided by the number widget at my level"

	^ subpart
]

{ #category : #accessing }
BLHorizontalChild >> subpart: anObject [
	anObject < 1
		ifTrue: [ subpart := 1 ]
		ifFalse: [ subpart := anObject floor ]
]
