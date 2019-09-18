Class {
	#name : #CSNUICWMooseModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model-CoreWeb'
}

{ #category : #initialization }
CSNUICWMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #CSNUICoreWebGenerator) metamodel
]
