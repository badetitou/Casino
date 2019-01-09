Class {
	#name : #BLServiceAPI,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#serviceOwner => FMOne type: #BLService opposite: #actions'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLServiceAPI class >> annotation [

	<MSEClass: #ServiceAPI super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLServiceAPI class >> generatedSlotNames [
	<generated>
	'BLServiceAPI class>>#generatedSlotNames'.
	^ #(serviceOwner)
]

{ #category : #generator }
BLServiceAPI class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLServiceAPI class >> requirements [

	<generated>
	^ { BLService }
]

{ #category : #accessing }
BLServiceAPI >> belongsTo [

	<generated>
	^ self serviceOwner

]

{ #category : #accessing }
BLServiceAPI >> belongsTo: anObject [

	<generated>
	self serviceOwner: anObject

]

{ #category : #accessing }
BLServiceAPI >> serviceOwner [

	<generated>
	<container>

	^ serviceOwner
]

{ #category : #accessing }
BLServiceAPI >> serviceOwner: anObject [

	<generated>
	serviceOwner := anObject

]

{ #category : #navigation }
BLServiceAPI >> serviceOwnerGroup [

	<generated>
	<navigation: 'ServiceOwner'>
	^ MooseGroup
			with: (self serviceOwner)
]
