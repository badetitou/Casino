Class {
	#name : #CSNService,
	#superclass : #CSNOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #CSNServiceAPI opposite: #serviceOwner'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNService class >> annotation [

	<MSEClass: #Service super: #CSNOriginedEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNService class >> generatedSlotNames [
	<generated>
	'CSNService class>>#generatedSlotNames'.
	^ #(actions)
]

{ #category : #generator }
CSNService class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNService class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNService >> actions [

	<generated>
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
	^ MooseGroup
			withAll: (self actions asSet)
]
