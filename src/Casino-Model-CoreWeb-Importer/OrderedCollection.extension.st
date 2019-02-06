Extension { #name : #OrderedCollection }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
OrderedCollection >> acceptVisitor: aVisitor [
	self do: [ :each | aVisitor visitNode: each ]
]
