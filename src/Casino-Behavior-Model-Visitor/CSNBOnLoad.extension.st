Extension { #name : #CSNBOnLoad }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnLoad >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnLoad: self
]
