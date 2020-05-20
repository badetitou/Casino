Extension { #name : #CSNBOnFocus }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnFocus >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnFocus: self
]
