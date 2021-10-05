Extension { #name : #CSNBOnError }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnError >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnError: self
]
