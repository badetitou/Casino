"
I'm specific to Berger-Levrault (company). Do not use me if you don't know what you're doing.
"
Class {
	#name : #CSNBusinessPage,
	#superclass : #CSNUIContainer,
	#instVars : [
		'#pageContainers => FMMany type: #BLPage opposite: #businessPage',
		'#title'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNBusinessPage class >> annotation [

	<MSEClass: #BusinessPage super: #CSNUIContainer>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBusinessPage class >> generatedSlotNames [
	<generated>
	'BLBusinessPage class>>#generatedSlotNames'.
	^ #(pageContainers title)
]

{ #category : #generator }
CSNBusinessPage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBusinessPage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNBusinessPage >> pageContainers [

	<generated>
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
	^ MooseGroup
			withAll: (self pageContainers asSet)
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
