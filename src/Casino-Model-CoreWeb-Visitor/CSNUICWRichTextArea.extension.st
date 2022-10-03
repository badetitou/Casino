Extension { #name : #CSNUICWRichTextArea }

{ #category : #'*Casino-Model-CoreWeb-Visitor' }
CSNUICWRichTextArea >> accept: aVisitor [
	^ aVisitor visitCSNUICWRichTextArea: self 
]
