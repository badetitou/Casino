Extension { #name : #CSNUIReadonly }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNUIReadonly class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNUIReadonly: self
]
