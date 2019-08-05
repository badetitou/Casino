Extension { #name : #CSNProgressBar }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNProgressBar class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNProgressBar: self
]
