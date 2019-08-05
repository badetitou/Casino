Extension { #name : #CSNUIClass }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIClass class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIClass: self
]
