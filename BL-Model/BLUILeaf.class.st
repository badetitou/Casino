"
I am a widget that cannot contain any other widget
"
Class {
	#name : #BLUILeaf,
	#superclass : #BLWidget,
	#instVars : [
		'text'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLUILeaf class >> annotation [

	<generated>
	<MSEClass: #UILeaf super: #BLWidget>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #testing }
BLUILeaf class >> canHandle: anInvocation [
	^ false
]

{ #category : #generator }
BLUILeaf class >> generatedSlotNames [
	<generated>
	'BLUILeaf class>>#generatedSlotNames'.
	^ #()
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
BLUILeaf >> getDom [
	^ text
]

{ #category : #accessing }
BLUILeaf >> recursiveWidgets [
	^ {self}
]

{ #category : #accessing }
BLUILeaf >> text [
	^ text
]

{ #category : #accessing }
BLUILeaf >> text: anObject [
	text := anObject
]
