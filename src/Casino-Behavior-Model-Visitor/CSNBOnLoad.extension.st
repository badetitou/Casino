Extension { #name : #CSNBOnLoad }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnLoad >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnLoad: self
]
