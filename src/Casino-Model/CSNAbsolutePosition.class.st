Class {
	#name : #CSNAbsolutePosition,
	#superclass : #CSNPosition,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNAbsolutePosition class >> annotation [

	<MSEClass: #AbsolutePosition super: #CSNPosition>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNAbsolutePosition class >> generatedSlotNames [
	<generated>
	'BLAbsolutePosition class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNAbsolutePosition class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNAbsolutePosition class >> requirements [

	<generated>
	^ {  }
]
