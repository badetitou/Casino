Class {
	#name : #BLPageMetier,
	#superclass : #BLUIContainer,
	#instVars : [
		'#phaseContainers => FMMany type: #BLPhase opposite: #pageMetiers',
		'#title'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLPageMetier class >> annotation [

	<MSEClass: #PageMetier super: #BLUIContainer>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLPageMetier class >> generatedSlotNames [
	<generated>
	'BLPageMetier class>>#generatedSlotNames'.
	^ #(title phaseContainers)
]

{ #category : #generator }
BLPageMetier class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLPageMetier class >> requirements [

	<generated>
	^ {  }
]

{ #category : #'as yet unclassified' }
BLPageMetier >> idViewChild [
	^ ''
]

{ #category : #accessing }
BLPageMetier >> phaseContainers [

	<generated>
	^ phaseContainers
]

{ #category : #accessing }
BLPageMetier >> phaseContainers: anObject [

	<generated>
	phaseContainers value: anObject

]

{ #category : #navigation }
BLPageMetier >> phaseContainersGroup [

	<generated>
	<navigation: 'PhaseContainers'>
	^ MooseGroup
			withAll: (self phaseContainers asSet)
]

{ #category : #accessing }
BLPageMetier >> title [

	<MSEProperty: #title type: #String>
	<generated>
	<MSEComment: 'The main title of the page metier'>
	^ title
]

{ #category : #accessing }
BLPageMetier >> title: anObject [

	<generated>
	title := anObject

]
