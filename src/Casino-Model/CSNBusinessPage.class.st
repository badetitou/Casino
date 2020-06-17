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

	<FMClass: #BusinessPage super: #CSNContainer>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNBusinessPage >> addPageContainer: anObject [
	<generated>
	^ self pageContainers add: anObject
]

{ #category : #'as yet unclassified' }
CSNBusinessPage >> gtActionsTSCodeIn: composite [
	<gtInspectorPresentationOrder: 1012>
	composite text
		title: 'TS';
		display: [ String streamContents: [ :s | (CSNModelExporterAngularBLSpecific on: s) generateTSSourceCodeForBusinessPage: self ] ];
		withLineNumbers: true	";
		when: [ self actions isNotEmpty and: [ self actions anyOne behavior isNotEmpty ] ]"
]

{ #category : #accessing }
CSNBusinessPage >> pageContainers [
	"Relation named: #pageContainers type: #CSNPage opposite: #businessPage"

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
	^ MooseGroup withAll: self pageContainers asSet
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
