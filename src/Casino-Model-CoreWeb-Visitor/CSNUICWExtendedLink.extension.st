Extension { #name : #CSNUICWExtendedLink }

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWExtendedLink >> accept: aVisitor [
	^ aVisitor visitCSNUICWExtendedLink: self 
]

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWExtendedLink class >> accept: aVisitor [
	^ aVisitor visitCSNUICWExtendedLink: self 
]
