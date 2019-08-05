Extension { #name : #CSNSwitch }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNSwitch class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNSwitch: self
]
