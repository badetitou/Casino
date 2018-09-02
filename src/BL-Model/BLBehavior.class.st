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

{ #category : #navigation }
BLBehavior >> actionAttributesGroup [

	<generated>
	<navigation: 'ActionAttributes'>
	^ MooseGroup
			withAll: (self actionAttributes asSet)
]
