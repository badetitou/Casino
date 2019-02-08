"
@FLAG: May be could be removed to have a simpler core model.
Each language would have to implement it correctly then

A behavioural entity that can be referenced with a name.

Assumed to correspond to a function or a method
"
Class {
	#name : #CSNBNamedBehaviouralEntity,
	#superclass : #CSNBBehaviouralEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBNamedBehaviouralEntity class >> annotation [

	<MSEClass: #NamedBehaviouralEntity super: #CSNBBehaviouralEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBNamedBehaviouralEntity class >> generatedSlotNames [
	<generated>
	'CSNBNamedBehaviouralEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBNamedBehaviouralEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
CSNBNamedBehaviouralEntity class >> requirements [

	<generated>
	^ {  }
]
