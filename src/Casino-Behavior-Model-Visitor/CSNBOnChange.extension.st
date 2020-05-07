Extension { #name : #CSNBOnChange }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnChange >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnChange: self 
]
