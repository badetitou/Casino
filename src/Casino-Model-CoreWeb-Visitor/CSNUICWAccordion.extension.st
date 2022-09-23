Extension { #name : #CSNUICWAccordion }

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWAccordion >> accept: aVisitor [
	^ aVisitor visitCSNUICWAccordion: self
]

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWAccordion class >> accept: aVisitor [
	^ aVisitor visitCSNUICWAccordion: self
]
