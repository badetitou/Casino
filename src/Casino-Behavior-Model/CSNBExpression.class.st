"
An abstract superclass representing an expression node of a source code.
"
Class {
	#name : #CSNBExpression,
	#superclass : #CSNBEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBExpression class >> annotation [

	<MSEClass: #Expression super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBExpression class >> generatedSlotNames [
	<generated>
	'CSNBExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBExpression class >> requirements [

	<generated>
	^ {  }
]
