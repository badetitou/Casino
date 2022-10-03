Extension { #name : #CSNUICWDynamicFieldset }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWDynamicFieldset class >> accept: aVisitor [
	^ aVisitor visitCSNUICWDynamicFieldset: self
]
