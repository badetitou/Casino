Extension { #name : #CSNUITable }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUITable class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUITable: self
]
