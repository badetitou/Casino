Extension { #name : #CSNBOnSubmit }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnSubmit >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnSubmit: self 
]
