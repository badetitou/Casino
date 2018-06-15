"
I represent the bahavior that make an asynchronious call to a distant service 
"
Class {
	#name : #BLServiceAction,
	#superclass : #BLBehavior,
	#traits : 'BLTServiceAction',
	#classTraits : 'BLTServiceAction classTrait',
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLServiceAction class >> annotation [

	<generated>
	<MSEClass: #ServiceAction super: #BLBehavior>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLServiceAction class >> generatedSlotNames [
	<generated>
	'BLServiceAction class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
BLServiceAction class >> generatedTraitNames [
	<generated>
	^ #(BLTServiceAction)
]

{ #category : #meta }
BLServiceAction class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLServiceAction >> serviceActionOwnerGroup [

	<generated>
	<navigation: 'ServiceActionOwner'>
	^ MooseGroup
			with: (self serviceActionOwner)
]
