Class {
	#name : #BLOriginedEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamed + FamixTWithSourceAnchor',
	#classTraits : 'FamixTNamed classTrait + FamixTWithSourceAnchor classTrait',
	#instVars : [
		'#source'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLOriginedEntity class >> annotation [

	<MSEClass: #OriginedEntity super: #MooseEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLOriginedEntity class >> generatedSlotNames [
	<generated>
	'BLOriginedEntity class>>#generatedSlotNames'.
	^ #(source)
]

{ #category : #generator }
BLOriginedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed FamixTWithSourceAnchor)
]

{ #category : #meta }
BLOriginedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #BLMetamodelGenerator) metamodel
]

{ #category : #meta }
BLOriginedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
BLOriginedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
BLOriginedEntity >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
BLOriginedEntity >> source [

	<MSEProperty: #source type: #MooseEntity>
	<generated>
	<MSEComment: 'The source of the element (from the importation)'>
	^ source
]

{ #category : #accessing }
BLOriginedEntity >> source: anObject [

	<generated>
	source := anObject

]
