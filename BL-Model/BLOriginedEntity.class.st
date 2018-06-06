Class {
	#name : #BLOriginedEntity,
	#superclass : #MooseEntity,
	#traits : 'FmxNGTNamed + FmxNGTWithSourceAnchor',
	#classTraits : 'FmxNGTNamed classTrait + FmxNGTWithSourceAnchor classTrait',
	#instVars : [
		'#source'
	],
	#category : 'BL-Model-Entities'
}

{ #category : #meta }
BLOriginedEntity class >> annotation [

	<generated>
	<MSEClass: #OriginedEntity super: #MooseEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLOriginedEntity class >> generatedSlotNames [
	<generated>
	^ #(source)
]

{ #category : #generator }
BLOriginedEntity class >> generatedTraitNames [
	<generated>
	^ #(FmxNGTNamed FmxNGTWithSourceAnchor)
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
