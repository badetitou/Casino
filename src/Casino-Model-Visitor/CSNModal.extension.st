Extension { #name : #CSNModal }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNModal class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNModal: self
]
