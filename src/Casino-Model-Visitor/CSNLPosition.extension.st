Extension { #name : #CSNLPosition }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNLPosition >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLPosition: self
]

{ #category : #'*Casino-Model-Visitor-generated' }
CSNLPosition class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLPosition: self
]
