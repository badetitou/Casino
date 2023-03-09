Extension { #name : #CSNUIInputYear }

{ #category : #'*Casino-Model-Visitor' }
CSNUIInputYear >> accept: aCSNModelVisitor [

	^ aCSNModelVisitor visitCSNUIInputYear: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUIInputYear class >> accept: aCSNModelVisitor [

	^ aCSNModelVisitor visitCSNUIInputYear: self
]
