Extension { #name : #CSNUICWSwitch }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWSwitch class >> accept: aVisitor [
	^ aVisitor visitCSNUICWSwitch: self 
]
