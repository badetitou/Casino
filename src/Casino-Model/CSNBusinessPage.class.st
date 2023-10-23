"
I'm specific to Berger-Levrault (company). Do not use me if you don't know what you're doing.
"
Class {
	#name : #CSNBusinessPage,
	#superclass : #CSNContainer,
	#instVars : [
		'#pageContainer => FMOne type: #CSNPage opposite: #businessPage',
		'#title => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNBusinessPage class >> annotation [

	<FMClass: #BusinessPage super: #CSNContainer>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNBusinessPage >> pageContainer [
	"Relation named: #pageContainer type: #CSNPage opposite: #businessPage"

	<generated>
	<container>
	^ pageContainer
]

{ #category : #accessing }
CSNBusinessPage >> pageContainer: anObject [

	<generated>
	pageContainer := anObject
]

{ #category : #navigation }
CSNBusinessPage >> pageContainerGroup [
	<generated>
	<navigation: 'PageContainer'>
	^ MooseSpecializedGroup with: self pageContainer
]

{ #category : #accessing }
CSNBusinessPage >> title [

	<FMProperty: #title type: #String>
	<generated>
	<FMComment: 'The main title of the page metier'>
	^ title
]

{ #category : #accessing }
CSNBusinessPage >> title: anObject [
	<generated>
	title := anObject
]
