Extension { #name : #CSNHTML }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNHTML >> accept: aVisitor [
	^ aVisitor visitBLHTML: self
]
