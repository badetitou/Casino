Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNOriginedEntity class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNOriginedEntity: self
]
