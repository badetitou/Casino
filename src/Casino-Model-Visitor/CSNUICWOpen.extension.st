Extension { #name : #CSNUICWOpen }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWOpen class >> accept: aVisitor [
	^ aVisitor visitCSNUICWOpen: self 
]
