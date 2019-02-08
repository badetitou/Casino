Class {
	#name : #CSNBNamedEntity,
	#superclass : #CSNBEntity,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBNamedEntity class >> annotation [

	<MSEClass: #NamedEntity super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBNamedEntity class >> generatedSlotNames [
	<generated>
	'CSNBNamedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBNamedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
CSNBNamedEntity class >> requirements [

	<generated>
	^ {  }
]
