Class {
	#name : #CSNBMooseModel,
	#superclass : #MooseModel,
	#category : #'Casino-Behavior-Model'
}

{ #category : #initialization }
CSNBMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #CSNBehaviorModelGenerator) metamodel
]
