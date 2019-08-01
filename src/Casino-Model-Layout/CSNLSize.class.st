Class {
	#name : #CSNLSize,
	#superclass : #MooseEntity,
	#category : #'Casino-Model-Layout-Entities'
}

{ #category : #meta }
CSNLSize class >> annotation [

	<MSEClass: #Size super: #MooseEntity>
	<package: #'Casino-Model-Layout'>
	<generated>
	^self
]

{ #category : #meta }
CSNLSize class >> metamodel [

	<generated>
	^ (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]
