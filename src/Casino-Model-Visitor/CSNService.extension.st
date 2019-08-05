Extension { #name : #CSNService }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNService class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNService: self
]
