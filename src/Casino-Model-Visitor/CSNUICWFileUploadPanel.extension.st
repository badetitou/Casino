Extension { #name : #CSNUICWFileUploadPanel }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWFileUploadPanel >> accept: aVisitor [
	^ aVisitor visitCSNUICWFileUploadPanel: self 
]

{ #category : #'*Casino-Model-Visitor' }
CSNUICWFileUploadPanel classSide >> accept: aVisitor [
	^ aVisitor visitCSNUICWFileUploadPanel: self
]
