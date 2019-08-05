Extension { #name : #CSNDynamicFieldset }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNDynamicFieldset class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNDynamicFieldset: self
]
