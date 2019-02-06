"
I reprensent a widget without sub-widget (like a paragraph, a text, a simple button, ...)
"
Class {
	#name : #CSNUILeaf,
	#superclass : #CSNWidget,
	#instVars : [
		'text'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNUILeaf class >> annotation [

	<MSEClass: #UILeaf super: #CSNWidget>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNUILeaf class >> generatedSlotNames [
	<generated>
	'CSNUILeaf class>>#generatedSlotNames'.
	^ #(text)
]

{ #category : #generator }
CSNUILeaf class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNUILeaf class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNUILeaf >> text [

	<MSEProperty: #text type: #String>
	<generated>
	^ text
]

{ #category : #accessing }
CSNUILeaf >> text: anObject [

	<generated>
	text := anObject

]
