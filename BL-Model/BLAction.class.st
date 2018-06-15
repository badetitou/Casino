Class {
	#name : #BLAction,
	#superclass : #MooseEntity,
	#traits : 'BLTAction + FmxNGTAssociation',
	#classTraits : 'BLTAction classTrait + FmxNGTAssociation classTrait',
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLAction class >> annotation [

	<generated>
	<MSEClass: #Action super: #MooseEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLAction class >> generatedSlotNames [
	<generated>
	'BLAction class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
BLAction class >> generatedTraitNames [
	<generated>
	^ #(BLTAction FmxNGTAssociation)
]

{ #category : #meta }
BLAction class >> metamodel [

	<generated>
	^ (self class environment at: #BLMetamodelGenerator) metamodel
]

{ #category : #meta }
BLAction class >> requirements [

	<generated>
	^ {  }
]

{ #category : #navigation }
BLAction >> actionOwnerGroup [

	<generated>
	<navigation: 'ActionOwner'>
	^ MooseGroup
			with: (self actionOwner)
]
