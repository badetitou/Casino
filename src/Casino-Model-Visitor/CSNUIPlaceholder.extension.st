Extension { #name : #CSNUIPlaceholder }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIPlaceholder class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIPlaceholder: self
]
