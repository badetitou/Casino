Class {
	#name : #CSNUIMooseModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model-UI-SubEntities'
}

{ #category : #initialization }
CSNUIMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #CSNUISubEntitiesGenerator) metamodel
]
