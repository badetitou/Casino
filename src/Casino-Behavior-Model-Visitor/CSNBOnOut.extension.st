Extension { #name : #CSNBOnOut }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnOut >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnOut: self
]
