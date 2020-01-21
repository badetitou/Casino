Extension { #name : #CSNBDOMElementAcccess }

{ #category : #'*Casino-Behavior-Model-Visitor' }
CSNBDOMElementAcccess >> accept: aBehaviorVisitor [
	^ aBehaviorVisitor visitDOMElementAcccess: self 
]
