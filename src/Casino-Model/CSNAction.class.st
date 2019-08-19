"
I do the link between UI and Behavioural meta-model (and I represent some specials other behavior)
"
Class {
	#name : #CSNAction,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#caller => FMOne type: #CSNWidget opposite: #actions'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNAction class >> annotation [

	<MSEClass: #Action super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNAction class >> requirements [

	<generated>
	^ { CSNWidget }
]

{ #category : #accessing }
CSNAction >> belongsTo [

	<generated>
	^ self caller

]

{ #category : #accessing }
CSNAction >> belongsTo: anObject [

	<generated>
	self caller: anObject

]

{ #category : #accessing }
CSNAction >> caller [

	<generated>
	<container>

	^ caller
]

{ #category : #accessing }
CSNAction >> caller: anObject [

	<generated>
	caller := anObject

]

{ #category : #navigation }
CSNAction >> callerGroup [
	<generated>
	<navigation: 'Caller'>
	^ MooseGroup with: self caller
]
