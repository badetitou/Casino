"
I reprensent a widget without sub-widget (like a paragraph, a text, a simple button, ...)
"
Class {
	#name : #BLUILeaf,
	#superclass : #BLWidget,
	#instVars : [
		'text'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLUILeaf class >> annotation [

	<MSEClass: #UILeaf super: #BLWidget>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLUILeaf class >> generatedSlotNames [
	<generated>
	'BLUILeaf class>>#generatedSlotNames'.
	^ #(text)
]

{ #category : #generator }
BLUILeaf class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLUILeaf class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLUILeaf >> text [

	<MSEProperty: #text type: #String>
	<generated>
	^ text
]

{ #category : #accessing }
BLUILeaf >> text: anObject [

	<generated>
	text := anObject

]
