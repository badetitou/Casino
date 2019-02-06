Class {
	#name : #CSNAlignement,
	#superclass : #CSNPosition,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNAlignement class >> annotation [

	<MSEClass: #Alignement super: #CSNPosition>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNAlignement class >> generatedSlotNames [
	<generated>
	'BLAlignement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNAlignement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNAlignement class >> requirements [

	<generated>
	^ {  }
]
