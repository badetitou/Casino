Extension { #name : #CSNBPopUp }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBPopUp >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitPopUp: self 
]
