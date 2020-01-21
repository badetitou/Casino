Extension { #name : #CSNBOpenDialog }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBOpenDialog >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitOpenDialog: self 
]
