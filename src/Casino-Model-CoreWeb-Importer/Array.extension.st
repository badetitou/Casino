Extension { #name : #Array }

{ #category : #'*Casino-Model-CoreWeb-Importer' }
Array >> acceptVisitor: aVisitor [
	self do: [ :each | each ifNotNil: [ aVisitor visitNode: each  ]] 
]
