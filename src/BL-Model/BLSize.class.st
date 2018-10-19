Class {
	#name : #BLSize,
	#superclass : #MooseEntity,
	#category : #'BL-Model-Entities'
}

{ #category : #meta }
BLSize class >> annotation [

	<MSEClass: #Size super: #MooseEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
BLSize class >> generatedSlotNames [
	<generated>
	'BLSize class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
BLSize class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
BLSize class >> metamodel [

	<generated>
	^ (self class environment at: #BLLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
BLSize class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
BLSize >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
BLSize >> isType [

	<generated>
	^ false
]
