Extension { #name : #CSNUICWSwitch }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWSwitch >> accept: aVisitor [
	^ aVisitor visitCSNUICWSwitch: self 
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWSwitch classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWSwitch: self 
]
