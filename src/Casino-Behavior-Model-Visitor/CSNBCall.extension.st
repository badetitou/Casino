Extension { #name : #CSNBCall }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBCall >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCall: self 
]
