"
I reprensent a call to a distant service
"
Class {
	#name : #CSNActionService,
	#superclass : #CSNAction,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNActionService class >> annotation [

	<MSEClass: #ActionService super: #CSNAction>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNActionService class >> generatedSlotNames [
	<generated>
	'BLActionService class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNActionService class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNActionService class >> requirements [

	<generated>
	^ {  }
]
