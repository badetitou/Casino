"
A block of statements as ones in C-like langs with {}
"
Class {
	#name : #CSNBStatementBlock,
	#superclass : #CSNBStatement,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBStatementBlock class >> annotation [

	<MSEClass: #StatementBlock super: #CSNBStatement>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBStatementBlock class >> generatedSlotNames [
	<generated>
	'CSNBStatementBlock class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBStatementBlock class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBStatementBlock class >> requirements [

	<generated>
	^ {  }
]
