Extension { #name : #CSNBusinessPage }

{ #category : #'*Casino-Model-Visitor-generated' }
CSNBusinessPage class >> accept: aCSNModelVisitor [
	^ aCSNModelVisitor visitCSNBusinessPage: self
]
