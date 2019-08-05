Extension { #name : #CSNUIValue }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIValue class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIValue: self
]
