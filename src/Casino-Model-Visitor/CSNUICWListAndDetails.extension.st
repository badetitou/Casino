Extension { #name : #CSNUICWListAndDetails }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWListAndDetails class >> accept: aVisitor [
	^ aVisitor visitCSNUICWListAndDetails: self 
]
