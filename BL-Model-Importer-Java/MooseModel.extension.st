Extension { #name : #MooseModel }

{ #category : #'*BL-Model-Importer-Java' }
MooseModel >> constructors [
 ^ self allModelMethods select: #isConstructor
	
]
