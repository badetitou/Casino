"
A return statement node. Contains a reference to the expression which is returned.  
"
Class {
	#name : #CSNBReturnStatement,
	#superclass : #CSNBStatement,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBReturnStatement class >> annotation [

	<MSEClass: #ReturnStatement super: #CSNBStatement>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBReturnStatement class >> generatedSlotNames [
	<generated>
	'CSNBReturnStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBReturnStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBReturnStatement class >> requirements [

	<generated>
	^ {  }
]
