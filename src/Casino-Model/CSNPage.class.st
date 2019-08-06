"
I represent the root of the user interface (A Windows, a web page)
"
Class {
	#name : #CSNPage,
	#superclass : #CSNContainer,
	#instVars : [
		'#businessPage => FMMany type: #CSNBusinessPage opposite: #pageContainers',
		'#caller => FMMany type: #CSNActionAppel opposite: #call',
		'#codePhase => FMProperty',
		'#codeValue => FMProperty',
		'#realClassName => FMProperty',
		'#subtitle => FMProperty',
		'#title => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNPage class >> annotation [

	<MSEClass: #Page super: #CSNContainer>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNPage >> addCaller: anObject [
			
	<generated>
	^ self caller add: anObject
]

{ #category : #accessing }
CSNPage >> businessPage [

	<generated>
	^ businessPage
]

{ #category : #accessing }
CSNPage >> businessPage: anObject [

	<generated>
	businessPage value: anObject

]

{ #category : #navigation }
CSNPage >> businessPageGroup [

	<generated>
	<navigation: 'BusinessPage'>
	^ MooseGroup
			withAll: (self businessPage asSet)
]

{ #category : #accessing }
CSNPage >> caller [

	<generated>
	^ caller
]

{ #category : #accessing }
CSNPage >> caller: anObject [

	<generated>
	caller value: anObject

]

{ #category : #navigation }
CSNPage >> callerGroup [

	<generated>
	<navigation: 'Caller'>
	^ MooseGroup
			withAll: (self caller asSet)
]

{ #category : #accessing }
CSNPage >> codePhase [

	<MSEProperty: #codePhase type: #String>
	<generated>
	<MSEComment: 'The unique code of the Phase'>
	^ codePhase
]

{ #category : #accessing }
CSNPage >> codePhase: anObject [

	<generated>
	codePhase := anObject

]

{ #category : #accessing }
CSNPage >> codeValue [

	<MSEProperty: #codeValue type: #String>
	<generated>
	<MSEComment: 'The short name of the codePhase'>
	^ codeValue
]

{ #category : #accessing }
CSNPage >> codeValue: anObject [

	<generated>
	codeValue := anObject

]

{ #category : #accessing }
CSNPage >> realClassName [

	<MSEProperty: #realClassName type: #String>
	<generated>
	<MSEComment: 'The name of the class in Java'>
	^ realClassName
]

{ #category : #accessing }
CSNPage >> realClassName: anObject [

	<generated>
	realClassName := anObject

]

{ #category : #accessing }
CSNPage >> subtitle [

	<MSEProperty: #subtitle type: #String>
	<generated>
	<MSEComment: 'The subtitle of the phase'>
	^ subtitle
]

{ #category : #accessing }
CSNPage >> subtitle: anObject [

	<generated>
	subtitle := anObject

]

{ #category : #accessing }
CSNPage >> title [

	<MSEProperty: #title type: #String>
	<generated>
	<MSEComment: 'The main title of the phase'>
	^ title
]

{ #category : #accessing }
CSNPage >> title: anObject [

	<generated>
	title := anObject

]
