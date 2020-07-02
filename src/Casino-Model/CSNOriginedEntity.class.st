"
Root entity of the meta-model
"
Class {
	#name : #CSNOriginedEntity,
	#superclass : #CSNEntity,
	#traits : 'TEntityMetaLevelDependency',
	#classTraits : 'TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#name => FMProperty',
		'#sources => FMProperty'
	],
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNOriginedEntity class >> annotation [

	<FMClass: #OriginedEntity super: #CSNEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #accessing }
CSNOriginedEntity >> name [

	<FMProperty: #name type: #String>
	<generated>
	^ name
]

{ #category : #accessing }
CSNOriginedEntity >> name: anObject [
	<generated>
	name := anObject
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
