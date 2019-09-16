Extension { #name : #CSNUIMenuItem }

{ #category : #'*Casino-Model-Visitor' }
CSNUIMenuItem >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIMenuItem: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUIMenuItem class >> accept: aCSNModelVisitor [
	<generated>
	^ aCSNModelVisitor visitCSNUIMenuItem: self
]
