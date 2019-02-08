"
Represents a generic behavioural entity which has parameters and local variables, as well as statements. 

Can represent a SmalltalkBlock, or a JavaLambda
Subclassed for NamedBehavioural as methods/functions

Has parameters , and a body (StatementBlock).
Local variables are intended to be stored in the local entities of the body
"
Class {
	#name : #CSNBBehaviouralEntity,
	#superclass : #CSNBScopableEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBBehaviouralEntity class >> annotation [

	<MSEClass: #BehaviouralEntity super: #CSNBScopableEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBBehaviouralEntity class >> generatedSlotNames [
	<generated>
	'CSNBBehaviouralEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBBehaviouralEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBBehaviouralEntity class >> requirements [

	<generated>
	^ {  }
]
