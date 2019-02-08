Class {
	#name : #CSNBAssociation,
	#superclass : #MooseEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBAssociation class >> annotation [

	<MSEClass: #Association super: #MooseEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBAssociation class >> generatedSlotNames [
	<generated>
	'CSNBAssociation class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBAssociation class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBAssociation class >> metamodel [

	<generated>
	^ (self class environment at: #CSNBehaviorModelGenerator) metamodel
]

{ #category : #meta }
CSNBAssociation class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNBAssociation >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNBAssociation >> isType [

	<generated>
	^ false
]
