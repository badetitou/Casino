Extension { #name : #CSNUICWGroupFieldset }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWGroupFieldset >> accept: aVisitor [
	^ aVisitor visitCSNUICWGroupFieldset: self
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWGroupFieldset classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWGroupFieldset: self
]
