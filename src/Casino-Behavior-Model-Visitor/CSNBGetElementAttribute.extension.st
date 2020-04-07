Extension { #name : #CSNBGetElementAttribute }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBGetElementAttribute >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitGetElementAttribute: self 
]
