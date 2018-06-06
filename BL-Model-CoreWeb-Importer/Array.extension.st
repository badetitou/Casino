Extension { #name : #Array }

{ #category : #'*BL-Model-CoreWeb-Importer' }
Array >> acceptVisitor: aVisitor [
	self do: [ :each | each ifNotNil: [ aVisitor visitNode: each  ]] 
]
