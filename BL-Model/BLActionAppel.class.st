Class {
	#name : #BLActionAppel,
	#superclass : #BLAction,
	#traits : 'BLTActionAppel',
	#classTraits : 'BLTActionAppel classTrait',
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLActionAppel class >> annotation [

	<generated>
	<MSEClass: #ActionAppel super: #BLAction>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLActionAppel class >> generatedSlotNames [
	<generated>
	^ #()
]

{ #category : #generator }
BLActionAppel class >> generatedTraitNames [
	<generated>
	^ #(BLTActionAppel)
]

{ #category : #meta }
BLActionAppel class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLActionAppel >> actionAppelGroup [

	<generated>
	<navigation: 'ActionAppel'>
	^ MooseGroup
			with: (self actionAppel)
]

{ #category : #navigation }
BLActionAppel >> phaseGroup [

	<generated>
	<navigation: 'Phase'>
	^ MooseGroup
			with: (self phase)
]
