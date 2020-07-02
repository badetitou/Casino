Extension { #name : #CSNUICWListAndDetails }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWListAndDetails >> accept: aVisitor [
	^ aVisitor visitCSNUICWListAndDetails: self 
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWListAndDetails class >> accept: aVisitor [
	^ aVisitor visitCSNUICWListAndDetails: self 
]
