Extension { #name : #CSNRichTextArea }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNRichTextArea class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNRichTextArea: self
]
