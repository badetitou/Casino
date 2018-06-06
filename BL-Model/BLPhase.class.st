"
I represent the root container of an application or of a subproject of an application
"
Class {
	#name : #BLPhase,
	#superclass : #BLOriginedEntity,
	#traits : 'BLTWithActionAppels + BLTWithPageMetiers',
	#classTraits : 'BLTWithActionAppels classTrait + BLTWithPageMetiers classTrait',
	#instVars : [
		'#codePhase',
		'#codeValue',
		'#realClassName',
		'#subtitle',
		'#title'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLPhase class >> annotation [

	<generated>
	<MSEClass: #Phase super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLPhase class >> generatedSlotNames [
	<generated>
	^ #(codePhase codeValue realClassName)
]

{ #category : #generator }
BLPhase class >> generatedTraitNames [
	<generated>
	^ #(BLTWithActionAppels BLTWithPageMetiers)
]

{ #category : #meta }
BLPhase class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLPhase >> actionAppelsGroup [

	<generated>
	<navigation: 'ActionAppels'>
	^ MooseGroup
			withAll: (self actionAppels asSet)
]

{ #category : #accessing }
BLPhase >> codePhase [

	<MSEProperty: #codePhase type: #String>
	<generated>
	<MSEComment: 'The unique code of the Phase'>
	^ codePhase
]

{ #category : #accessing }
BLPhase >> codePhase: anObject [

	<generated>
	codePhase := anObject

]

{ #category : #accessing }
BLPhase >> codeValue [

	<MSEProperty: #codeValue type: #String>
	<generated>
	<MSEComment: 'The short name of the codePhase'>
	^ codeValue
]

{ #category : #accessing }
BLPhase >> codeValue: anObject [

	<generated>
	codeValue := anObject

]

{ #category : #navigation }
BLPhase >> pageMetiersGroup [

	<generated>
	<navigation: 'PageMetiers'>
	^ MooseGroup
			withAll: (self pageMetiers asSet)
]

{ #category : #accessing }
BLPhase >> realClassName [

	<MSEProperty: #realClassName type: #String>
	<generated>
	<MSEComment: 'The name of the class in Java'>
	^ realClassName
]

{ #category : #accessing }
BLPhase >> realClassName: anObject [

	<generated>
	realClassName := anObject

]

{ #category : #accessing }
BLPhase >> subtitle [
	<MSEProperty: #subtitle type: #String>
	^ subtitle
]

{ #category : #accessing }
BLPhase >> subtitle: anObject [
	subtitle := anObject
]

{ #category : #accessing }
BLPhase >> title [
	<MSEProperty: #title type: #String>
	^ title
]

{ #category : #accessing }
BLPhase >> title: anObject [
	title := anObject
]
