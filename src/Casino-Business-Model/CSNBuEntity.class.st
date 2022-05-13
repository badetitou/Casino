Class {
	#name : #CSNBuEntity,
	#superclass : #MooseEntity,
	#category : #'Casino-Business-Model-Entities'
}

{ #category : #meta }
CSNBuEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Casino-Business-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNBuEntity class >> metamodel [

	<generated>
	^ CSNBuModel metamodel
]

{ #category : #testing }
CSNBuEntity >> isBusinessType [

	<generated>
	^ false
]

{ #category : #testing }
CSNBuEntity >> isCollectionType [

	<generated>
	^ false
]

{ #category : #testing }
CSNBuEntity >> isComplexType [

	<generated>
	^ false
]

{ #category : #testing }
CSNBuEntity >> isDictionaryType [

	<generated>
	^ false
]

{ #category : #testing }
CSNBuEntity >> isPrimitive [

	<generated>
	^ false
]

{ #category : #testing }
CSNBuEntity >> isSetType [

	<generated>
	^ false
]
