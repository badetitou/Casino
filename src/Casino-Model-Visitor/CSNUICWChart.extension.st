Extension { #name : #CSNUICWChart }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWChart >> accept: aVisitor [
	^ aVisitor visitCSNUICWChart: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWChart classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWChart: self
]
