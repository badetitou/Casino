Class {
	#name : #CSNEntity,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Entities'
}

{ #category : #meta }
CSNEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Casino-Model'>
	<generated>
	^self
]

{ #category : #meta }
CSNEntity class >> metamodel [

	<generated>
	^ CSNModel metamodel
]
