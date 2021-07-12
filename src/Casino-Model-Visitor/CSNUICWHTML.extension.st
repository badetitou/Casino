Extension { #name : #CSNUICWHTML }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWHTML >> accept: aVisitor [
	^ aVisitor visitCSNUICWHTML: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWHTML classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWHTML: self
]
