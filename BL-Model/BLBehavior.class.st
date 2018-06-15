"
I represent the bahavior code of a fonctionnality

I am the indirection to gui code (that don't depend of the application)

The mechanism of a popup/async request/disabling staff/saveStaff/ etc..
"
Class {
	#name : #BLBehavior,
	#superclass : #BLOriginedEntity,
	#traits : 'BLTWithActionAttributes',
	#classTraits : 'BLTWithActionAttributes classTrait',
	#category : 'BL-Model-Entities'
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
	^ #()
]

{ #category : #generator }
BLBehavior class >> generatedTraitNames [
	<generated>
	^ #(BLTWithActionAttributes)
]

{ #category : #meta }
BLBehavior class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLBehavior >> actionAttributesGroup [

	<generated>
	<navigation: 'ActionAttributes'>
	^ MooseGroup
			withAll: (self actionAttributes asSet)
]
