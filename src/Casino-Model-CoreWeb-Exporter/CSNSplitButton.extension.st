Extension { #name : #CSNSplitButton }

{ #category : #'*Casino-Model-CoreWeb-Exporter' }
CSNSplitButton >> accept: aVisitor [
	^ aVisitor visitBLSplitButton: self
]
