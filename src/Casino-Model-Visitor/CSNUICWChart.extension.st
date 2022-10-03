Extension { #name : #CSNUICWChart }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWChart class >> accept: aVisitor [
	^ aVisitor visitCSNUICWChart: self
]
