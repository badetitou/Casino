"
I represent a special call that lead to the navigation to another page of the application
"
Class {
	#name : #CSNBNavigation,
	#superclass : #CSNBEntity,
	#traits : 'FASTTExpression',
	#classTraits : 'FASTTExpression classTrait',
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBNavigation class >> annotation [

	<FMClass: #Navigation super: #CSNBEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNBNavigation >> addArgument: anObject [
	<generated>
	^ self arguments add: anObject
]

{ #category : #accessing }
CSNBNavigation >> arguments [
	"Relation named: #arguments type: #FASTTExpression opposite: #navigation"

	<generated>
	<derived>
	<FMProperty: #arguments type: #FASTTExpression opposite: #navigation>
	^ self attributeAt: #arguments ifAbsentPut: [ FMMultivalueLink on: self opposite: #navigation: ]
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
	^ MooseSpecializedGroup withAll: self arguments asSet
]

{ #category : #accessing }
CSNBNavigation >> page [
	"Relation named: #page type: #CSNPage opposite: #navigations"

	<generated>
	<FMProperty: #page type: #CSNPage opposite: #navigations>
	^ self attributeAt: #page ifAbsent: [ nil ]
]

{ #category : #accessing }
CSNBNavigation >> page: anObject [

	<generated>
	self attributeAt: #page put: (FMMultivalueLink on: self update: #navigations from: self page to: anObject).
]
