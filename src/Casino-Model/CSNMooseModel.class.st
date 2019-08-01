Class {
	#name : #CSNMooseModel,
	#superclass : #MooseModel,
	#category : #'Casino-Model'
}

{ #category : #initialization }
CSNMooseModel >> initialize [
		<generated>
		super initialize.
		self metamodel: (self class environment at: #CSNMetamodelGenerator) metamodel
]
