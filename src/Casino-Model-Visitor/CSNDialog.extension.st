Extension { #name : #CSNDialog }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNDialog class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNDialog: self
]
