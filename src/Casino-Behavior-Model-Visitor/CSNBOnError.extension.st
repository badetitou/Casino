Extension { #name : #CSNBOnError }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnError >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnError: self 
]
