Extension { #name : #CSNUIList }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIList class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIList: self
]
