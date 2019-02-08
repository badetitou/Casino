"
A literal node.

Contains a value for the literal.

FLAG: should refactor some literals to core-model
    e.g.: character, int, float, string, boolean 
"
Class {
	#name : #CSNBLiteral,
	#superclass : #CSNBExpression,
	#instVars : [
		'value'
	],
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBLiteral class >> annotation [

	<MSEClass: #Literal super: #CSNBExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBLiteral class >> generatedSlotNames [
	<generated>
	'CSNBLiteral class>>#generatedSlotNames'.
	^ #(value)
]

{ #category : #generator }
CSNBLiteral class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBLiteral class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNBLiteral >> value [

	<MSEProperty: #value type: #String>
	<generated>
	<MSEComment: 'The literal itself as found in the source code'>
	^ value
]

{ #category : #accessing }
CSNBLiteral >> value: anObject [

	<generated>
	value := anObject

]
