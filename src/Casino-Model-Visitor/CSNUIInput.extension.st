Extension { #name : #CSNUIInput }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIInput class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIInput: self
]
