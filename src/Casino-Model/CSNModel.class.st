Class {
	#name : #CSNModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model'
}

{ #category : #meta }
CSNModel class >> annotation [
	<MSEClass: #CSNModel super: #MooseModel>
	<package: #'Casino-Model'>
	<generated>
]

{ #category : #initialization }
CSNModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #CSNMetamodelGenerator) metamodel
]
