Class {
	#name : #CSNRelativePosition,
	#superclass : #CSNPosition,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNRelativePosition class >> annotation [

	<MSEClass: #RelativePosition super: #CSNPosition>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNRelativePosition class >> generatedSlotNames [
	<generated>
	'BLRelativePosition class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNRelativePosition class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNRelativePosition class >> requirements [

	<generated>
	^ {  }
]
