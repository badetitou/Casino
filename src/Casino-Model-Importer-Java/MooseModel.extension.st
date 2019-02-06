Extension { #name : #MooseModel }

{ #category : #'*Casino-Model-Importer-Java' }
MooseModel >> constructors [
 ^ self allModelMethods select: #isConstructor
	
]
