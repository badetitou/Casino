Class {
	#name : #CSNServiceAPI,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#serviceOwner => FMOne type: #BLService opposite: #actions'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNServiceAPI class >> annotation [

	<MSEClass: #ServiceAPI super: #CSNOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNServiceAPI class >> generatedSlotNames [
	<generated>
	'BLServiceAPI class>>#generatedSlotNames'.
	^ #(serviceOwner)
]

{ #category : #generator }
CSNServiceAPI class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNServiceAPI class >> requirements [

	<generated>
	^ { CSNService }
]

{ #category : #accessing }
CSNServiceAPI >> belongsTo [

	<generated>
	^ self serviceOwner

]

{ #category : #accessing }
CSNServiceAPI >> belongsTo: anObject [

	<generated>
	self serviceOwner: anObject

]

{ #category : #accessing }
CSNServiceAPI >> serviceOwner [

	<generated>
	<container>

	^ serviceOwner
]

{ #category : #accessing }
CSNServiceAPI >> serviceOwner: anObject [

	<generated>
	serviceOwner := anObject

]

{ #category : #navigation }
CSNServiceAPI >> serviceOwnerGroup [

	<generated>
	<navigation: 'ServiceOwner'>
	^ MooseGroup
			with: (self serviceOwner)
]
