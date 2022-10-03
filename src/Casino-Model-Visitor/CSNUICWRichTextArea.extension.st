Extension { #name : #CSNUICWRichTextArea }

{ #category : #'*Casino-Model-Visitor' }
CSNUICWRichTextArea class >> accept: aVisitor [
	^ aVisitor visitCSNUICWRichTextArea: self 
]
