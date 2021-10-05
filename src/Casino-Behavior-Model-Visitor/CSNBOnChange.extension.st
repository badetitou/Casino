Extension { #name : #CSNBOnChange }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnChange >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnChange: self
]
