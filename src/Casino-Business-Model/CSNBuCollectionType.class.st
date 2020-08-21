"
I represent a collection of one DataType
"
Class {
	#name : #CSNBuCollectionType,
	#superclass : #CSNBuComplexType,
	#instVars : [
		'#type => FMOne type: #CSNBuDTO opposite: #inCollectionTypes'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuCollectionType class >> annotation [

	<FMClass: #CollectionType super: #CSNBuComplexType>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBuCollectionType >> isCollectionType [

	<generated>
	^ true
]

{ #category : #accessing }
CSNBuCollectionType >> type [
	"Relation named: #type type: #CSNBuDTO opposite: #inCollectionTypes"

	<generated>
	^ type
]

{ #category : #accessing }
CSNBuCollectionType >> type: anObject [

	<generated>
	type := anObject
]
