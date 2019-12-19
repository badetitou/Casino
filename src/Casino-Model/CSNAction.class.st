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

	<FMClass: #Action super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNAction >> caller [
	"Relation named: #caller type: #CSNWidget opposite: #actions"

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
