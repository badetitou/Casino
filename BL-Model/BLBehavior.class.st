"
I represent the bahavior code of a fonctionnality

I am the indirection to gui code (that don't depend of the application)

The mechanism of a popup/async request/disabling staff/saveStaff/ etc..
"
Class {
	#name : #BLBehavior,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actionAttributes => FMMany type: #BLActionAttribute opposite: #behaviors'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLBehavior class >> annotation [

	<generated>
	<MSEClass: #Behavior super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLBehavior class >> generatedSlotNames [
	<generated>
	'BLBehavior class>>#generatedSlotNames'.
	^ #(actionAttributes)
]

{ #category : #generator }
BLBehavior class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLBehavior class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLBehavior >> actionAttributes [

	<generated>
	^ actionAttributes
]

{ #category : #accessing }
BLBehavior >> actionAttributes: anObject [

	<generated>
	actionAttributes value: anObject

]
