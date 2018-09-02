Class {
	#name : #BLServiceAction,
	#superclass : #BLBehavior,
	#instVars : [
		'#serviceOwner => FMOne type: #BLService opposite: #actions'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLServiceAction class >> annotation [

	<MSEClass: #ServiceAction super: #BLBehavior>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLServiceAction class >> generatedSlotNames [
	<generated>
	'BLServiceAction class>>#generatedSlotNames'.
	^ #(serviceOwner)
]

{ #category : #generator }
BLServiceAction class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLServiceAction class >> requirements [

	<generated>
	^ { BLServiceAction }
]

{ #category : #accessing }
BLServiceAction >> serviceOwner [

	<generated>
	<container>

	^ serviceOwner
]

{ #category : #accessing }
BLServiceAction >> serviceOwner: anObject [

	<generated>
	serviceOwner := anObject

]

{ #category : #navigation }
BLServiceAction >> serviceOwnerGroup [

	<generated>
	<navigation: 'ServiceOwner'>
	^ MooseGroup
			with: (self serviceOwner)
]
