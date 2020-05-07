Extension { #name : #CSNBOnClick }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnClick >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnClick: self 
]
