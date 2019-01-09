"
I'm specific to Berger-Levrault (company). Do not use me if you don't know what you're doing.
"
Class {
	#name : #BLBusinessPage,
	#superclass : #BLUIContainer,
	#instVars : [
		'#pageContainers => FMMany type: #BLPage opposite: #businessPage',
		'#title'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLBusinessPage class >> annotation [

	<MSEClass: #BusinessPage super: #BLUIContainer>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLBusinessPage class >> generatedSlotNames [
	<generated>
	'BLBusinessPage class>>#generatedSlotNames'.
	^ #(pageContainers title)
]

{ #category : #generator }
BLBusinessPage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLBusinessPage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
BLBusinessPage >> pageContainers [

	<generated>
	^ pageContainers
]

{ #category : #accessing }
BLBusinessPage >> pageContainers: anObject [

	<generated>
	pageContainers value: anObject

]

{ #category : #navigation }
BLBusinessPage >> pageContainersGroup [

	<generated>
	<navigation: 'PageContainers'>
	^ MooseGroup
			withAll: (self pageContainers asSet)
]

{ #category : #accessing }
BLBusinessPage >> title [

	<MSEProperty: #title type: #String>
	<generated>
	<MSEComment: 'The main title of the page metier'>
	^ title
]

{ #category : #accessing }
BLBusinessPage >> title: anObject [

	<generated>
	title := anObject

]
