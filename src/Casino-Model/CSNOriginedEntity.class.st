"
Root entity of the meta-model
"
Class {
	#name : #CSNOriginedEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamed + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamed classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#source',
		'#sources => FMProperty'
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

{ #category : #private }
CSNOriginedEntity >> gtNodesIn: composite [
	<gtInspectorPresentationOrder: 1000>
	^ composite tree
		title: 'Tree';
		display: [ :anObject | anObject ];
		children: [ :each | each children ];
		yourself
]

{ #category : #accessing }
CSNOriginedEntity >> sources [

	<MSEProperty: #sources type: #Object>
	<generated>
	<MSEComment: 'The sources of the element
It may reference multiple entity if the entity is defined in different context
example: in a JavaProgram and in a XML file'>
	^ sources
]

{ #category : #accessing }
CSNOriginedEntity >> sources: anObject [

	<generated>
	sources := anObject

]
