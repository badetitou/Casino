Class {
	#name : #CSNService,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #CSNServiceAPI opposite: #serviceOwner',
		'#targetPoint => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNService class >> annotation [

	<FMClass: #Service super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNService >> actions [
	"Relation named: #actions type: #CSNServiceAPI opposite: #serviceOwner"

	<generated>
	<derived>
	^ actions
]

{ #category : #accessing }
CSNService >> actions: anObject [

	<generated>
	actions value: anObject
]

{ #category : #navigation }
CSNService >> actionsGroup [
	<generated>
	<navigation: 'Actions'>
	^ MooseGroup withAll: self actions asSet
]

{ #category : #adding }
CSNService >> addAction: anObject [
	<generated>
	^ self actions add: anObject
]

{ #category : #accessing }
CSNService >> targetPoint [

	<FMProperty: #targetPoint type: #String>
	<generated>
	<FMComment: 'The url of the distant service'>
	^ targetPoint
]

{ #category : #accessing }
CSNService >> targetPoint: anObject [
	<generated>
	targetPoint := anObject
]
