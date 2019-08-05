Extension { #name : #CSNModel }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNModel class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNModel: self
]
