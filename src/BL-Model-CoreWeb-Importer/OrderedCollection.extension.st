Extension { #name : #OrderedCollection }

{ #category : #'*BL-Model-CoreWeb-Importer' }
OrderedCollection >> acceptVisitor: aVisitor [
	self do: [ :each | aVisitor visitNode: each ]
]
