"
I represent the root of the user interface (A Windows, a web page)
"
Class {
	#name : #CSNPage,
	#superclass : #CSNContainer,
	#instVars : [
		'#businessPage => FMMany type: #CSNBusinessPage opposite: #pageContainer',
		'#caller => FMMany type: #CSNActionAppel opposite: #call',
		'#codePhase => FMProperty',
		'#codeValue => FMProperty',
		'#realClassName => FMProperty',
		'#shortcut => FMProperty',
		'#subtitle => FMProperty',
		'#title => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNPage class >> annotation [

	<FMClass: #Page super: #CSNContainer>
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
	"Relation named: #businessPage type: #CSNBusinessPage opposite: #pageContainer"

	<generated>
	<derived>
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
	^ MooseSpecializedGroup withAll: self businessPage asSet
]

{ #category : #accessing }
CSNPage >> caller [
	"Relation named: #caller type: #CSNActionAppel opposite: #call"

	<generated>
	<derived>
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
	^ MooseSpecializedGroup withAll: self caller asSet
]

{ #category : #accessing }
CSNPage >> codePhase [

	<FMProperty: #codePhase type: #String>
	<generated>
	<FMComment: 'The unique code of the Phase'>
	^ codePhase
]

{ #category : #accessing }
CSNPage >> codePhase: anObject [
	<generated>
	codePhase := anObject
]

{ #category : #accessing }
CSNPage >> codeValue [

	<FMProperty: #codeValue type: #String>
	<generated>
	<FMComment: 'The short name of the codePhase'>
	^ codeValue
]

{ #category : #accessing }
CSNPage >> codeValue: anObject [
	<generated>
	codeValue := anObject
]

{ #category : #accessing }
CSNPage >> componentName [
	^ (self getAcceptedName , 'Component') capitalized 
]

{ #category : #accessing }
CSNPage >> realClassName [

	<FMProperty: #realClassName type: #String>
	<generated>
	<FMComment: 'The name of the class in Java'>
	^ realClassName
]

{ #category : #accessing }
CSNPage >> realClassName: anObject [
	<generated>
	realClassName := anObject
]

{ #category : #accessing }
CSNPage >> shortcut [

	<FMProperty: #shortcut type: #String>
	<generated>
	<FMComment: 'The shortcut to the page'>
	^ shortcut
]

{ #category : #accessing }
CSNPage >> shortcut: anObject [
	<generated>
	shortcut := anObject
]

{ #category : #accessing }
CSNPage >> subtitle [

	<FMProperty: #subtitle type: #String>
	<generated>
	<FMComment: 'The subtitle of the phase'>
	^ subtitle
]

{ #category : #accessing }
CSNPage >> subtitle: anObject [
	<generated>
	subtitle := anObject
]

{ #category : #accessing }
CSNPage >> title [

	<FMProperty: #title type: #String>
	<generated>
	<FMComment: 'The main title of the phase'>
	^ title
]

{ #category : #accessing }
CSNPage >> title: anObject [
	<generated>
	title := anObject
]
