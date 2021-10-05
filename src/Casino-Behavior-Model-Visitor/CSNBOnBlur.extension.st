Extension { #name : #CSNBOnBlur }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnBlur >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnBlur: self
]
