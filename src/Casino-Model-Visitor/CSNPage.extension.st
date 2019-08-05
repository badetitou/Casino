Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNPage class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNPage: self
]
