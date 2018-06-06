Class {
	#name : #BLPageMetier,
	#superclass : #BLUIContainer,
	#traits : 'BLTWithPhases',
	#classTraits : 'BLTWithPhases classTrait',
	#instVars : [
		'#title'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLPageMetier class >> annotation [

	<generated>
	<MSEClass: #PageMetier super: #BLUIContainer>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLPageMetier class >> generatedSlotNames [
	<generated>
	^ #()
]

{ #category : #generator }
BLPageMetier class >> generatedTraitNames [
	<generated>
	^ #(BLTWithPhases)
]

{ #category : #meta }
BLPageMetier class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLPageMetier >> phasesGroup [

	<generated>
	<navigation: 'Phases'>
	^ MooseGroup
			withAll: (self phases asSet)
]

{ #category : #accessing }
BLPageMetier >> recursiveMetiers [
	^ (self metiers , (self metiers collect: #recursiveMetiers)) flattened
]

{ #category : #accessing }
BLPageMetier >> recursiveWidgets [
	^ (self widgets , (self widgets collect: #recursiveWidgets)) flattened
]

{ #category : #accessing }
BLPageMetier >> title [
	<MSEProperty: #title type: #String>
	^ title
]

{ #category : #accessing }
BLPageMetier >> title: anObject [
	title := anObject
]
