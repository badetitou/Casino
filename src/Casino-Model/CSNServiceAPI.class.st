Class {
	#name : #CSNServiceAPI,
	#superclass : #CSNOriginedEntity,
	#instVars : [
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
