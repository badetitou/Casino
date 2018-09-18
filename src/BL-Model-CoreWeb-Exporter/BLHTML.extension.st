Extension { #name : #BLHTML }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLHTML >> accept: aVisitor [
	^ aVisitor visitBLHTML: self
]
