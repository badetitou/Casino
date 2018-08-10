Class {
	#name : #BLAction,
	#superclass : #MooseEntity,
	#traits : 'FmxNGTAssociation',
	#classTraits : 'FmxNGTAssociation classTrait',
	#instVars : [
		'#caller => FMOne type: #BLWidget opposite: #actions'
	],
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
	^ #(caller)
]

{ #category : #generator }
BLAction class >> generatedTraitNames [
	<generated>
	^ #(FmxNGTAssociation)
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

{ #category : #accessing }
BLAction >> caller [

	<generated>
	<container>

	^ caller
]

{ #category : #accessing }
BLAction >> caller: anObject [

	<generated>
	caller := anObject

]
