"
I do the link between UI and Behavioural meta-model (and I represent some specials other behavior)
"
Class {
	#name : #BLAction,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#caller => FMOne type: #BLWidget opposite: #actions'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLAction class >> annotation [

	<MSEClass: #Action super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLAction class >> generatedSlotNames [
	<generated>
	'BLAction class>>#generatedSlotNames'.
	^ #(caller)
]

{ #category : #generator }
BLAction class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLAction class >> requirements [

	<generated>
	^ { BLWidget }
]

{ #category : #accessing }
BLAction >> belongsTo [

	<generated>
	^ self caller

]

{ #category : #accessing }
BLAction >> belongsTo: anObject [

	<generated>
	self caller: anObject

]

{ #category : #accessing }
BLAction >> caller [

	<generated>
	<container>

	^ caller
]

{ #category : #accessing }
BLAction >> caller: anObject [

	<generated>
	caller := anObject

]

{ #category : #navigation }
BLAction >> callerGroup [

	<generated>
	<navigation: 'Caller'>
	^ MooseGroup
			with: (self caller)
]
