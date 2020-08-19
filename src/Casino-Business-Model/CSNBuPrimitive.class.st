"
I represent simple and know type used in many application
"
Class {
	#name : #CSNBuPrimitive,
	#superclass : #CSNBuDTO,
	#instVars : [
		'#name => FMProperty'
	],
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuPrimitive class >> annotation [

	<FMClass: #Primitive super: #CSNBuDTO>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #testing }
CSNBuPrimitive >> isPrimitive [

	<generated>
	^ true
]

{ #category : #accessing }
CSNBuPrimitive >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CSNBuPrimitive >> name: anObject [
	<generated>
	name := anObject
]
