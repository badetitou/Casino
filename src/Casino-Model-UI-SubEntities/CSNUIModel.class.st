Class {
	#name : #CSNUIModel,
	#superclass : #CSNAttribute,
	#category : #'Casino-Model-UI-SubEntities-Attributes-Extended'
}

{ #category : #meta }
CSNUIModel class >> annotation [
	<MSEClass: #CSNUIModel super: #MooseModel>
	<package: #'Casino-Model-UI-SubEntities'>
	<generated>
]

{ #category : #initialization }
CSNUIModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #CSNUISubEntitiesGenerator) metamodel
]
