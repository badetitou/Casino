Class {
	#name : #CSNBEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTWithSourceAnchor + TDependencyQueries + TEntityMetaLevelDependency',
	#classTraits : 'FamixTWithSourceAnchor classTrait + TDependencyQueries classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#childrenNode => FMMany type: #CSNBEntity opposite: #parentNode',
		'#parentNode => FMOne type: #CSNBEntity opposite: #childrenNode'
	],
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBEntity class >> annotation [

	<MSEClass: #Entity super: #MooseEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #generator }
CSNBEntity class >> generatedSlotNames [
	<generated>
	'CSNBEntity class>>#generatedSlotNames'.
	^ #(childrenNode parentNode)
]

{ #category : #generator }
CSNBEntity class >> generatedTraitNames [
	<generated>
	^ #(FamixTWithSourceAnchor TDependencyQueries TEntityMetaLevelDependency)
]

{ #category : #meta }
CSNBEntity class >> metamodel [

	<generated>
	^ (self class environment at: #CSNBehaviorModelGenerator) metamodel
]

{ #category : #meta }
CSNBEntity class >> requirements [

	<generated>
	^ { CSNBEntity }
]

{ #category : #accessing }
CSNBEntity >> belongsTo [

	<generated>
	^ self parentNode

]

{ #category : #accessing }
CSNBEntity >> belongsTo: anObject [

	<generated>
	self parentNode: anObject

]

{ #category : #accessing }
CSNBEntity >> childrenNode [

	<generated>
	^ childrenNode
]

{ #category : #accessing }
CSNBEntity >> childrenNode: anObject [

	<generated>
	childrenNode value: anObject

]

{ #category : #navigation }
CSNBEntity >> childrenNodeGroup [

	<generated>
	<navigation: 'ChildrenNode'>
	^ MooseGroup
			withAll: (self childrenNode asSet)
]

{ #category : #testing }
CSNBEntity >> isAccess [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isClass [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isInvocation [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isNamespace [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isPackage [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isReference [

	<generated>
	^ false
]

{ #category : #testing }
CSNBEntity >> isType [

	<generated>
	^ false
]

{ #category : #accessing }
CSNBEntity >> parentNode [

	<generated>
	<container>

	^ parentNode
]

{ #category : #accessing }
CSNBEntity >> parentNode: anObject [

	<generated>
	parentNode := anObject

]

{ #category : #navigation }
CSNBEntity >> parentNodeGroup [

	<generated>
	<navigation: 'ParentNode'>
	^ MooseGroup
			with: (self parentNode)
]
