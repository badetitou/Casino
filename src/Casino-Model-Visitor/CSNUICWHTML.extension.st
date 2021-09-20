Extension { #name : #CSNUICWHTML }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWHTML >> accept: aVisitor [
	^ aVisitor visitCSNUICWHTML: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWHTML class >> accept: aVisitor [
	^ aVisitor visitCSNUICWHTML: self
]
