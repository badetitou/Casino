Extension { #name : #CSNContainer }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNContainer class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNContainer: self
]
