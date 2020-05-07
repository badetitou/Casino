Extension { #name : #CSNBOnSubmitSuccess }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOnSubmitSuccess >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitCSNBOnSubmitSuccess: self 
]
