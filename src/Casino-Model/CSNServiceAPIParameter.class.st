Class {
	#name : #CSNServiceAPIParameter,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#serviceAPIOwner => FMOne type: #CSNServiceAPI opposite: #parameters'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNServiceAPIParameter class >> annotation [

	<FMClass: #ServiceAPIParameter super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNServiceAPIParameter >> serviceAPIOwner [
	"Relation named: #serviceAPIOwner type: #CSNServiceAPI opposite: #parameters"

	<generated>
	<container>
	^ serviceAPIOwner
]

{ #category : #accessing }
CSNServiceAPIParameter >> serviceAPIOwner: anObject [

	<generated>
	serviceAPIOwner := anObject
]

{ #category : #navigation }
CSNServiceAPIParameter >> serviceAPIOwnerGroup [
	<generated>
	<navigation: 'ServiceAPIOwner'>
	^ MooseGroup with: self serviceAPIOwner
]
