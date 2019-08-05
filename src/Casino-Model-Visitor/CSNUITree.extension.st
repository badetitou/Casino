Extension { #name : #CSNUITree }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUITree class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUITree: self
]
