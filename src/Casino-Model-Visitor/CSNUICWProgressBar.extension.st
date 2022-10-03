Extension { #name : #CSNUICWProgressBar }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWProgressBar class >> accept: aVisitor [
	^ aVisitor visitCSNUICWProgressBar: self 
]
