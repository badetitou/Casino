"
Root entity of the meta-model
"
Class {
	#name : #CSNOriginedEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamed + FamixTWithSourceAnchor',
	#classTraits : 'FamixTNamed classTrait + FamixTWithSourceAnchor classTrait',
	#instVars : [
		'#source'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNOriginedEntity class >> annotation [

	<MSEClass: #OriginedEntity super: #MooseEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNOriginedEntity class >> generatedSlotNames [
	<generated>
	'CSNOriginedEntity class>>#generatedSlotNames'.
	^ #(source)
]

{ #category : #generator }
CSNOriginedEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTNamed FamixTWithSourceAnchor)
]

{ #category : #meta }
CSNOriginedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
CSNOriginedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNOriginedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
CSNOriginedEntity >> source [

	<MSEProperty: #source type: #MooseEntity>
	<generated>
	<MSEComment: 'The source of the element (from the importation)'>
	^ source
]

{ #category : #accessing }
CSNOriginedEntity >> source: anObject [

	<generated>
	source := anObject

]
