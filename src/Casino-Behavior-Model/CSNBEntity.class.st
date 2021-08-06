Class {
	#name : #CSNBEntity,
	#superclass : #MooseEntity,
	#category : #'Casino-Behavior-Model-Entities'
}

{ #category : #meta }
CSNBEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Casino-Behavior-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNBEntity class >> metamodel [

	<generated>
	^ CSNBModel metamodel
]
