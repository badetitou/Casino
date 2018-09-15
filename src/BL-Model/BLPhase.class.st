Class {
	#name : #BLPhase,
	#superclass : #BLOriginedEntity,
	#instVars : [
		'#actions => FMMany type: #BLActionAppel opposite: #call',
		'#codePhase',
		'#codeValue',
		'#pageMetiers => FMMany type: #BLPageMetier opposite: #phaseContainers',
		'#realClassName',
		'#subtitle',
		'#title',
		'#widgets => FMMany type: #BLWidget opposite: #page'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLPhase class >> annotation [

	<MSEClass: #Phase super: #BLOriginedEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLPhase class >> generatedSlotNames [
	<generated>
	'BLPhase class>>#generatedSlotNames'.
	^ #(widgets pageMetiers realClassName subtitle codeValue title actions codePhase)
]

{ #category : #generator }
BLPhase class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLPhase class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLPhase >> actions [

	<generated>
	^ actions
]

{ #category : #accessing }
BLPhase >> actions: anObject [

	<generated>
	actions value: anObject

]

{ #category : #navigation }
BLPhase >> actionsGroup [

	<generated>
	<navigation: 'Actions'>
	^ MooseGroup
			withAll: (self actions asSet)
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

{ #category : #accessing }
BLPhase >> pageMetiers [

	<generated>
	^ pageMetiers
]

{ #category : #accessing }
BLPhase >> pageMetiers: anObject [

	<generated>
	pageMetiers value: anObject

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
	<generated>
	<MSEComment: 'The subtitle of the phase'>
	^ subtitle
]

{ #category : #accessing }
BLPhase >> subtitle: anObject [

	<generated>
	subtitle := anObject

]

{ #category : #accessing }
BLPhase >> title [

	<MSEProperty: #title type: #String>
	<generated>
	<MSEComment: 'The main title of the phase'>
	^ title
]

{ #category : #accessing }
BLPhase >> title: anObject [

	<generated>
	title := anObject

]

{ #category : #accessing }
BLPhase >> widgets [

	<generated>
	^ widgets
]

{ #category : #accessing }
BLPhase >> widgets: anObject [

	<generated>
	widgets value: anObject

]

{ #category : #navigation }
BLPhase >> widgetsGroup [

	<generated>
	<navigation: 'Widgets'>
	^ MooseGroup
			withAll: (self widgets asSet)
]
