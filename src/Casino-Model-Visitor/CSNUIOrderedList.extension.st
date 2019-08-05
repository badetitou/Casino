Extension { #name : #CSNUIOrderedList }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIOrderedList class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIOrderedList: self
]
