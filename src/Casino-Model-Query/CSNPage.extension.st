Extension { #name : #CSNPage }

{ #category : #'*Casino-Model-Query' }
CSNPage class >> color [
	^ Color veryVeryDarkGray
]

{ #category : #'*Casino-Model-Query' }
CSNPage >> outgoingElement [
	^ {self businessPage. self widgets} flatten
]
