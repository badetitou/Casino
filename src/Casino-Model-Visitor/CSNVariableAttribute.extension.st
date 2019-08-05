Extension { #name : #CSNVariableAttribute }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNVariableAttribute class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNVariableAttribute: self
]
