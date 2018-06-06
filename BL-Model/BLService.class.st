"
I represent a distant service (you need me if you want to make asynchronious call 

@see BLServiceAction
"
Class {
	#name : #BLService,
	#superclass : #BLOriginedEntity,
	#traits : 'BLTWithServiceActions',
	#classTraits : 'BLTWithServiceActions classTrait',
	#instVars : [
		'#actions'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLService class >> annotation [

	<generated>
	<MSEClass: #Service super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLService class >> generatedSlotNames [
	<generated>
	^ #()
]

{ #category : #generator }
BLService class >> generatedTraitNames [
	<generated>
	^ #(BLTWithServiceActions)
]

{ #category : #meta }
BLService class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLService >> serviceActionsGroup [

	<generated>
	<navigation: 'ServiceActions'>
	^ MooseGroup
			withAll: (self serviceActions asSet)
]
