Extension { #name : #CSNHTML }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNHTML class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNHTML: self
]
