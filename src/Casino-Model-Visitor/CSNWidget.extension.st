Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNWidget class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNWidget: self
]
