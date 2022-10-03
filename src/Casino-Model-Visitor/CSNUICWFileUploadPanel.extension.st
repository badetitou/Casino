Extension { #name : #CSNUICWFileUploadPanel }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWFileUploadPanel class >> accept: aVisitor [
	^ aVisitor visitCSNUICWFileUploadPanel: self
]
