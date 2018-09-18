Extension { #name : #BLSplitButton }

{ #category : #'*BL-Model-CoreWeb-Exporter' }
BLSplitButton >> accept: aVisitor [
	^ aVisitor visitBLSplitButton: self
]
