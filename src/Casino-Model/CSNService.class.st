Class {
	#name : #CSNService,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #CSNServiceAPI opposite: #serviceOwner',
		'#childServices => FMMany type: #CSNService opposite: #parentService',
		'#parentService => FMOne type: #CSNService opposite: #childServices',
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
	^ MooseSpecializedGroup withAll: self actions asSet
]

{ #category : #adding }
CSNService >> addAction: anObject [
	<generated>
	^ self actions add: anObject
]

{ #category : #adding }
CSNService >> addChildService: anObject [
	<generated>
	^ self childServices add: anObject
]

{ #category : #accessing }
CSNService >> childServices [
	"Relation named: #childServices type: #CSNService opposite: #parentService"

	<generated>
	<derived>
	^ childServices
]

{ #category : #accessing }
CSNService >> childServices: anObject [

	<generated>
	childServices value: anObject
]

{ #category : #navigation }
CSNService >> childServicesGroup [
	<generated>
	<navigation: 'ChildServices'>
	^ MooseSpecializedGroup withAll: self childServices asSet
]

{ #category : #accessing }
CSNService >> parentService [
	"Relation named: #parentService type: #CSNService opposite: #childServices"

	<generated>
	<container>
	^ parentService
]

{ #category : #accessing }
CSNService >> parentService: anObject [

	<generated>
	parentService := anObject
]

{ #category : #navigation }
CSNService >> parentServiceGroup [
	<generated>
	<navigation: 'ParentService'>
	^ MooseSpecializedGroup with: self parentService
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
