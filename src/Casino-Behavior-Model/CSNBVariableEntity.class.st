"
A representation of a variable entity, 
"
Class {
	#name : #CSNBVariableEntity,
	#superclass : #CSNBEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBVariableEntity class >> annotation [

	<MSEClass: #VariableEntity super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBVariableEntity class >> generatedSlotNames [
	<generated>
	'CSNBVariableEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBVariableEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
CSNBVariableEntity class >> requirements [

	<generated>
	^ {  }
]
