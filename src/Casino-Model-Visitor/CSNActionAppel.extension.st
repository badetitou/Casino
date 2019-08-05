Extension { #name : #CSNActionAppel }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNActionAppel class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNActionAppel: self
]
