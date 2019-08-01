Class {
	#name : #CSNLMooseModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model-Layout'
}

{ #category : #initialization }
CSNLMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #CSNLayoutMetamodelGenerator) metamodel
]
