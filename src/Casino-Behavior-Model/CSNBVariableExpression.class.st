"
A node that wraps around structural entity
"
Class {
	#name : #CSNBVariableExpression,
	#superclass : #CSNBExpression,
	#traits : 'FamixTNamed',
	#classTraits : 'FamixTNamed classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBVariableExpression class >> annotation [

	<MSEClass: #VariableExpression super: #CSNBExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBVariableExpression class >> generatedSlotNames [
	<generated>
	'CSNBVariableExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBVariableExpression class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed)
]

{ #category : #meta }
CSNBVariableExpression class >> requirements [

	<generated>
	^ {  }
]
