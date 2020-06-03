Extension { #name : #CSNBOnOver }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnOver >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnOver: self 
]
