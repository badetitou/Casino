Extension { #name : #CSNLeaf }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNLeaf class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLeaf: self
]
