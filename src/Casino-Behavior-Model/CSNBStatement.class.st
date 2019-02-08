"
An abstract subclass which represents a source code statemnet 
"
Class {
	#name : #CSNBStatement,
	#superclass : #CSNBScopableEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBStatement class >> annotation [

	<MSEClass: #Statement super: #CSNBScopableEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBStatement class >> generatedSlotNames [
	<generated>
	'CSNBStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBStatement class >> requirements [

	<generated>
	^ {  }
]
