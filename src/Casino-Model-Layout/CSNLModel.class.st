Class {
	#name : #CSNLModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model-Layout'
}

{ #category : #meta }
CSNLModel class >> annotation [
	<MSEClass: #CSNLModel super: #MooseModel>
	<package: #'Casino-Model-Layout'>
	<generated>
]

{ #category : #initialization }
CSNLModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]
