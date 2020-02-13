Extension { #name : #CSNBSetElementAttribute }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBSetElementAttribute >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitSetElementAttribute: self 
]
