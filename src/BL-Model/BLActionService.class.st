"
I reprensent a call to a distant service
"
Class {
	#name : #BLActionService,
	#superclass : #BLAction,
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLActionService class >> annotation [

	<MSEClass: #ActionService super: #BLAction>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLActionService class >> generatedSlotNames [
	<generated>
	'BLActionService class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
BLActionService class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLActionService class >> requirements [

	<generated>
	^ {  }
]
