Extension { #name : #CSNChart }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNChart class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNChart: self
]
