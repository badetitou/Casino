Extension { #name : #CSNInput }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNInput class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNInput: self
]
