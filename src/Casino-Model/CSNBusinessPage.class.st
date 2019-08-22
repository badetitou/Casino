"
I'm specific to Berger-Levrault (company). Do not use me if you don't know what you're doing.
"
Class {
	#name : #CSNBusinessPage,
	#superclass : #CSNContainer,
	#instVars : [
		'#pageContainers => FMMany type: #CSNPage opposite: #businessPage',
		'#title => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNBusinessPage class >> annotation [

	<MSEClass: #BusinessPage super: #CSNContainer>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNBusinessPage class >> requirements [

	<generated>
	^ { CSNPage }
]

{ #category : #adding }
CSNBusinessPage >> addPageContainers: anObject [
	<generated>
	^ self pageContainers add: anObject
]

{ #category : #accessing }
CSNBusinessPage >> pageContainers [

	<generated>
	<container>

	^ pageContainers
]

{ #category : #accessing }
CSNBusinessPage >> pageContainers: anObject [

	<generated>
	pageContainers value: anObject

]

{ #category : #navigation }
CSNBusinessPage >> pageContainersGroup [
	<generated>
	<navigation: 'PageContainers'>
	^ MooseGroup withAll: self pageContainers asSet
]

{ #category : #accessing }
CSNBusinessPage >> title [

	<MSEProperty: #title type: #String>
	<generated>
	<MSEComment: 'The main title of the page metier'>
	^ title
]

{ #category : #accessing }
CSNBusinessPage >> title: anObject [

	<generated>
	title := anObject

]
