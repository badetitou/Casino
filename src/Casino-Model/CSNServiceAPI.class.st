Class {
	#name : #CSNServiceAPI,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#parameters => FMMany type: #CSNServiceAPIParameter opposite: #serviceAPIOwner',
		'#serviceOwner => FMOne type: #CSNService opposite: #actions'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNServiceAPI class >> annotation [

	<FMClass: #ServiceAPI super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNServiceAPI >> addParameter: anObject [
	<generated>
	^ self parameters add: anObject
]

{ #category : #accessing }
CSNServiceAPI >> parameters [
	"Relation named: #parameters type: #CSNServiceAPIParameter opposite: #serviceAPIOwner"

	<generated>
	<derived>
	^ parameters
]

{ #category : #accessing }
CSNServiceAPI >> parameters: anObject [

	<generated>
	parameters value: anObject
]

{ #category : #navigation }
CSNServiceAPI >> parametersGroup [
	<generated>
	<navigation: 'Parameters'>
	^ MooseGroup withAll: self parameters asSet
]

{ #category : #accessing }
CSNServiceAPI >> serviceOwner [
	"Relation named: #serviceOwner type: #CSNService opposite: #actions"

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
	^ MooseGroup with: self serviceOwner
]
