Extension { #name : #CSNOpen }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNOpen class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNOpen: self
]
