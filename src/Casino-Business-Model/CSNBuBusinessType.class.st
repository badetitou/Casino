"
I represent a kind of data created by the developers of the application.
I am composed of other DTO
"
Class {
	#name : #CSNBuBusinessType,
	#superclass : #CSNBuDTO,
	#instVars : [
		'#attributes => FMMany type: #CSNBuAttribute opposite: #businessType',
		'#name => FMProperty'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuBusinessType class >> annotation [

	<FMClass: #BusinessType super: #CSNBuDTO>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #adding }
CSNBuBusinessType >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #accessing }
CSNBuBusinessType >> attributes [
	"Relation named: #attributes type: #CSNBuAttribute opposite: #businessType"

	<generated>
	<derived>
	^ attributes
]

{ #category : #accessing }
CSNBuBusinessType >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
CSNBuBusinessType >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseGroup withAll: self attributes asSet
]

{ #category : #testing }
CSNBuBusinessType >> isBusinessType [

	<generated>
	^ true
]

{ #category : #accessing }
CSNBuBusinessType >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CSNBuBusinessType >> name: anObject [
	<generated>
	name := anObject
]
