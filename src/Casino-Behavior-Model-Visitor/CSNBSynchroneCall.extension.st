Extension { #name : #CSNBSynchroneCall }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBSynchroneCall >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitSynchroneCall: self 
]
