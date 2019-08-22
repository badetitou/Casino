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

{ #category : #adding }
CSNBNavigation >> addArguments: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
CSNBNavigation >> arguments [

	<generated>
	<MSEProperty: #arguments type: #Object>
	<package: #'Casino-Bind-UIBehavior'>
	^ self privateState attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #navigation: ]
]

{ #category : #accessing }
CSNBNavigation >> arguments: anObject [

	<generated>
	self arguments value: anObject
]

{ #category : #navigation }
CSNBNavigation >> argumentsGroup [
	<generated>
	<navigation: 'Arguments'>
	^ MooseGroup withAll: self arguments asSet
]
