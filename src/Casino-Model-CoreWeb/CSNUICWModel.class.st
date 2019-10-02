Class {
	#name : #CSNUICWModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model-CoreWeb'
}

{ #category : #meta }
CSNUICWModel class >> annotation [
	<MSEClass: #CSNUICWModel super: #MooseModel>
	<package: #'Casino-Model-CoreWeb'>
	<generated>
]

{ #category : #initialization }
CSNUICWModel >> initialize [
	<generated>
	super initialize.
	self metamodel: (self class environment at: #CSNUICoreWebGenerator) metamodel
]
