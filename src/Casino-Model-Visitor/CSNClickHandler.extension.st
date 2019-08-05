Extension { #name : #CSNClickHandler }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNClickHandler class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNClickHandler: self
]
