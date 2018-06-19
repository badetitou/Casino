"
I represent a distant service (you need me if you want to make asynchronious call 

@see BLServiceAction
"
Class {
	#name : #BLService,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #BLServiceAction opposite: #serviceOwner'
	],
	#category : #'BL-Model-Entities'
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
	'BLService class>>#generatedSlotNames'.
	^ #(actions)
]

{ #category : #generator }
BLService class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLService class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLService >> actions [

	<generated>
	^ actions
]

{ #category : #accessing }
BLService >> actions: anObject [

	<generated>
	actions value: anObject

]
