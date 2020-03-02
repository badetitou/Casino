"
Root entity of the meta-model
"
Class {
	#name : #CSNOriginedEntity,
	#superclass : #MooseEntity,
	#traits : 'FamixTNamedEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#sources => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNOriginedEntity class >> annotation [

	<FMClass: #OriginedEntity super: #MooseEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNOriginedEntity class >> metamodel [

	<generated>
	^ CSNModel metamodel
]

{ #category : #accessing }
CSNOriginedEntity >> sources [

	<FMProperty: #sources type: #Object>
	<generated>
	<FMComment: 'The sources of the element
It may reference multiple entity if the entity is defined in different context
example: in a JavaProgram and in a XML file'>
	^ sources
]

{ #category : #accessing }
CSNOriginedEntity >> sources: anObject [
	<generated>
	sources := anObject
]
