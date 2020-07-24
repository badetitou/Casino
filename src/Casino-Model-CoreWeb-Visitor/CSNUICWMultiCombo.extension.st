Extension { #name : #CSNUICWMultiCombo }

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWMultiCombo >> accept: aVisitor [
	^ aVisitor visitCSNUICWMultiCombo: self 
]

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWMultiCombo class >> accept: aVisitor [
	^ aVisitor visitCSNUICWMultiCombo: self
]
