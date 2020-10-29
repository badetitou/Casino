Extension { #name : #CSNBOnBlur }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnBlur >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnBlur: self 
]
