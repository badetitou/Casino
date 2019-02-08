"
A Entity with an optional scope

Statements are scopable because many statements allow to introduce local variables (e.g. for statement in Java)
"
Class {
	#name : #CSNBScopableEntity,
	#superclass : #CSNBEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBScopableEntity class >> annotation [

	<MSEClass: #ScopableEntity super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBScopableEntity class >> generatedSlotNames [
	<generated>
	'CSNBScopableEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBScopableEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBScopableEntity class >> requirements [

	<generated>
	^ {  }
]
