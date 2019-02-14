Extension { #name : #CSNBAsynchroneCall }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBAsynchroneCall >> accept: aBehaviorVisitor [
	aBehaviorVisitor visitAsynchroneCall: self 
]
