Extension { #name : #CSNBOnSubmit }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnSubmit >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnSubmit: self
]
