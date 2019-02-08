"
I represent an asynchrone call to a distant service
"
Class {
	#name : #CSNBAsynchroneCall,
	#superclass : #CSNBCall,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBAsynchroneCall class >> annotation [

	<MSEClass: #AsynchroneCall super: #CSNBCall>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBAsynchroneCall class >> generatedSlotNames [
	<generated>
	'CSNBAsynchroneCall class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBAsynchroneCall class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBAsynchroneCall class >> requirements [

	<generated>
	^ {  }
]
