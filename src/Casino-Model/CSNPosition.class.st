Class {
	#name : #CSNPosition,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNPosition class >> annotation [

	<MSEClass: #Position super: #MooseEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNPosition class >> generatedSlotNames [
	<generated>
	'CSNPosition class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNPosition class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNPosition class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
CSNPosition class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNPosition >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNPosition >> isType [

	<generated>
	^ false
]
