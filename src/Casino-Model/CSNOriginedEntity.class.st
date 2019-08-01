"
Root entity of the meta-model
"
Class {
	#name : #CSNOriginedEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamed + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#source'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNOriginedEntity class >> annotation [

	<MSEClass: #OriginedEntity super: #MooseEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNOriginedEntity class >> metamodel [

	<generated>
	^ (self class environment at: #CSNMetamodelGenerator) metamodel
]

{ #category : #testing }
CSNOriginedEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
CSNOriginedEntity >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
CSNOriginedEntity >> source [

	<MSEProperty: #source type: #MooseEntity>
	<generated>
	<MSEComment: 'The source of the element (from the importation)'>
	^ source
]

{ #category : #accessing }
CSNOriginedEntity >> source: anObject [

	<generated>
	source := anObject

]
