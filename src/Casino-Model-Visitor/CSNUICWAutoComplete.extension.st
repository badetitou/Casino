Extension { #name : #CSNUICWAutoComplete }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWAutoComplete >> accept: aVisitor [
	^ aVisitor visitCSNUICWAutoComplete: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWAutoComplete classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWAutoComplete: self
]
