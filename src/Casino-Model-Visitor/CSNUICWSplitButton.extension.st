Extension { #name : #CSNUICWSplitButton }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWSplitButton class >> accept: aVisitor [
	^ aVisitor visitCSNUICWSplitButton: self 
]
