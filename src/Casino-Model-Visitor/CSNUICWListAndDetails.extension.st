Extension { #name : #CSNUICWListAndDetails }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWListAndDetails >> accept: aVisitor [
	^ aVisitor visitCSNUICWListAndDetails: self 
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWListAndDetails classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWListAndDetails: self 
]
