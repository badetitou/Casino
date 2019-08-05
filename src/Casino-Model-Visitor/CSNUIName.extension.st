Extension { #name : #CSNUIName }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIName class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIName: self
]
