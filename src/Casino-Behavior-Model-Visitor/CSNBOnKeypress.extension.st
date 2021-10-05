Extension { #name : #CSNBOnKeypress }

{ #category : #'*Casino-Behavior-Model-Visitor-generated' }
CSNBOnKeypress >> accept: aTCSNBehaviorVisitor [
	^ aTCSNBehaviorVisitor visitCSNBOnKeypress: self
]
