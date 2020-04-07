Extension { #name : #CSNBAccessElementAttribute }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBAccessElementAttribute >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitAccessElementAttribute: self 
]
