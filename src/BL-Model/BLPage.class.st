Class {
	#name : #BLPage,
	#superclass : #BLUIContainer,
	#instVars : [
		'#realClassName',
		'#subtitle',
		'#codeValue',
		'#businessPage => FMMany type: #BLBusinessPage opposite: #pageContainers',
		'#title',
		'#codePhase'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLPage class >> annotation [

	<MSEClass: #Page super: #BLUIContainer>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLPage class >> generatedSlotNames [
	<generated>
	'BLPage class>>#generatedSlotNames'.
	^ #(realClassName subtitle codeValue businessPage title actions codePhase)
]

{ #category : #generator }
BLPage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLPage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLPage >> actions [

	<generated>
	^ actions
]

{ #category : #accessing }
BLPage >> actions: anObject [

	<generated>
	actions value: anObject

]

{ #category : #navigation }
BLPage >> actionsGroup [

	<generated>
	<navigation: 'Actions'>
	^ MooseGroup
			withAll: (self actions asSet)
]

{ #category : #accessing }
BLPage >> businessPage [

	<generated>
	^ businessPage
]

{ #category : #accessing }
BLPage >> businessPage: anObject [

	<generated>
	businessPage value: anObject

]

{ #category : #navigation }
BLPage >> businessPageGroup [

	<generated>
	<navigation: 'BusinessPage'>
	^ MooseGroup
			withAll: (self businessPage asSet)
]

{ #category : #accessing }
BLPage >> codePhase [

	<MSEProperty: #codePhase type: #String>
	<generated>
	<MSEComment: 'The unique code of the Phase'>
	^ codePhase
]

{ #category : #accessing }
BLPage >> codePhase: anObject [

	<generated>
	codePhase := anObject

]

{ #category : #accessing }
BLPage >> codeValue [

	<MSEProperty: #codeValue type: #String>
	<generated>
	<MSEComment: 'The short name of the codePhase'>
	^ codeValue
]

{ #category : #accessing }
BLPage >> codeValue: anObject [

	<generated>
	codeValue := anObject

]

{ #category : #accessing }
BLPage >> realClassName [

	<MSEProperty: #realClassName type: #String>
	<generated>
	<MSEComment: 'The name of the class in Java'>
	^ realClassName
]

{ #category : #accessing }
BLPage >> realClassName: anObject [

	<generated>
	realClassName := anObject

]

{ #category : #accessing }
BLPage >> subtitle [

	<MSEProperty: #subtitle type: #String>
	<generated>
	<MSEComment: 'The subtitle of the phase'>
	^ subtitle
]

{ #category : #accessing }
BLPage >> subtitle: anObject [

	<generated>
	subtitle := anObject

]

{ #category : #accessing }
BLPage >> title [

	<MSEProperty: #title type: #String>
	<generated>
	<MSEComment: 'The main title of the phase'>
	^ title
]

{ #category : #accessing }
BLPage >> title: anObject [

	<generated>
	title := anObject

]
