"
I represent a special call that lead to the navigation to another page of the application
"
Class {
	#name : #CSNBNavigation,
	#superclass : #FASTExpression,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBNavigation class >> annotation [

	<MSEClass: #Navigation super: #FASTExpression>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBNavigation class >> generatedSlotNames [
	<generated>
	'CSNBNavigation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBNavigation class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBNavigation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
CSNBNavigation >> arguments [

	<generated>
	<MSEProperty: #arguments type: #Object>
	^ self privateState attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentNode: ]
]

{ #category : #accessing }
CSNBNavigation >> arguments: anObject [

	<generated>
	self arguments value: anObject
]

{ #category : #accessing }
CSNBNavigation >> page [

	<generated>
	<MSEProperty: #page type: #Object>
	^ self privateState attributeAt: #page ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBNavigation >> page: anObject [

	<generated>
	self privateState attributeAt: #page put: (FMMultivalueLink on: self update: #navigations from: self page to: anObject).
]
