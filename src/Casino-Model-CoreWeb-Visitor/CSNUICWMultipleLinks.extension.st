Extension { #name : #CSNUICWMultipleLinks }

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWMultipleLinks >> accept: aVisitor [
	^ aVisitor visitCSNUICWMultipleLinks: self
]

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWMultipleLinks class >> accept: aVisitor [
	^ aVisitor visitCSNUICWMultipleLinks: self
]
