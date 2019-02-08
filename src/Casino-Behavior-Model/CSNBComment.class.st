Class {
	#name : #CSNBComment,
	#superclass : #MooseEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBComment class >> annotation [

	<MSEClass: #Comment super: #MooseEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBComment class >> generatedSlotNames [
	<generated>
	'CSNBComment class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBComment class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBComment class >> metamodel [

	<generated>
	^ (self class environment at: #CSNBehaviorModelGenerator) metamodel
]

{ #category : #meta }
CSNBComment class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNBComment >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNBComment >> isType [

	<generated>
	^ false
]
