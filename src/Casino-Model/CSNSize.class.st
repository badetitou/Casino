Class {
	#name : #CSNSize,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNSize class >> annotation [

	<MSEClass: #Size super: #MooseEntity>
	<package: #'BL-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNSize class >> generatedSlotNames [
	<generated>
	'BLSize class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNSize class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNSize class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]

{ #category : #meta }
CSNSize class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNSize >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNSize >> isType [

	<generated>
	^ false
]
