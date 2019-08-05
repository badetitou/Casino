Extension { #name : #CSNAttribute }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNAttribute class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNAttribute: self
]
