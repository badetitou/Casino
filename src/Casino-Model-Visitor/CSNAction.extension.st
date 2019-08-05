Extension { #name : #CSNAction }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNAction class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNAction: self
]
