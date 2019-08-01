Class {
	#name : #CSNLPosition,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLPosition class >> annotation [

	<MSEClass: #Position super: #MooseEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #meta }
CSNLPosition class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]
