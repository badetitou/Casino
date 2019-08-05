Extension { #name : #CSNUICanvas }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUICanvas class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUICanvas: self
]
