Class {
	#name : #CSNBSourceLanguage,
	#superclass : #MooseEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBSourceLanguage class >> annotation [

	<MSEClass: #SourceLanguage super: #MooseEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBSourceLanguage class >> generatedSlotNames [
	<generated>
	'CSNBSourceLanguage class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
CSNBSourceLanguage class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
CSNBSourceLanguage class >> metamodel [

	<generated>
	^ (self class environment at: #CSNBehaviorModelGenerator) metamodel
]

{ #category : #meta }
CSNBSourceLanguage class >> requirements [

	<generated>
	^ {  }
]

{ #category : #testing }
CSNBSourceLanguage >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNBSourceLanguage >> isType [

	<generated>
	^ false
]
