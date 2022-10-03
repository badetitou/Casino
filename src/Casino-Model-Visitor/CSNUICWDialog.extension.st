Extension { #name : #CSNUICWDialog }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWDialog class >> accept: aVisitor [
	^ aVisitor visitCSNUICWDialog: self
]
