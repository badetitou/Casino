Extension { #name : #CSNBOnKeydown }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnKeydown >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnKeydown: self
]
