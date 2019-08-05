Extension { #name : #CSNServiceAPI }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNServiceAPI class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNServiceAPI: self
]
