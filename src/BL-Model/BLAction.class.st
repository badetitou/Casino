Class {
	#name : #BLAction,
	#superclass : #MooseEntity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#caller => FMOne type: #BLWidget opposite: #actions'
	],
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLAction class >> annotation [

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
	^ #(FamixTAssociation)
]

{ #category : #meta }
BLAction class >> metamodel [

	<generated>
	^ (self class environment at: #BLMetamodelGenerator) metamodel
]

{ #category : #meta }
BLAction class >> requirements [

	<generated>
	^ { BLAction }
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

{ #category : #navigation }
BLAction >> callerGroup [

	<generated>
	<navigation: 'Caller'>
	^ MooseGroup
			with: (self caller)
]

{ #category : #testing }
BLAction >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
BLAction >> isType [

	<generated>
	^ false
]
