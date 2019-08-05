Extension { #name : #CSNUIFieldset }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIFieldset class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIFieldset: self
]
