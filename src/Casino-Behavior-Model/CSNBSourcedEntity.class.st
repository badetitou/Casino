Class {
	#name : #CSNBSourcedEntity,
	#superclass : #MooseEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBSourcedEntity class >> annotation [

	<MSEClass: #SourcedEntity super: #MooseEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBSourcedEntity class >> generatedSlotNames [
	<generated>
	'CSNBSourcedEntity class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBSourcedEntity class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBSourcedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #CSNBehaviorModelGenerator) metamodel
]

{ #category : #meta }
CSNBSourcedEntity class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNBSourcedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourcedEntity >> isType [

	<generated>
	^ false
]
