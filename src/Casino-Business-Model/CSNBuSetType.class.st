"
I represent a set of one DataType.
"
Class {
	#name : #CSNBuSetType,
	#superclass : #CSNBuCollectionType,
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuSetType class >> annotation [

	<FMClass: #SetType super: #CSNBuCollectionType>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBuSetType >> isSetType [

	<generated>
	^ true
]
