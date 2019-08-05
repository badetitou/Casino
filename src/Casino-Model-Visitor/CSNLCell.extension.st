Extension { #name : #CSNLCell }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNLCell class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNLCell: self
]
