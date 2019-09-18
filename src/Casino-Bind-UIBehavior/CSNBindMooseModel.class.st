Class {
	#name : #CSNBindMooseModel,
	#superclass : #MooseModel,
	#category : #'Casino-Bind-UIBehavior'
}

{ #category : #initialization }
CSNBindMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #CSNUIFASTBindingGenerator) metamodel
]
