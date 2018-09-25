Extension { #name : #BLPage }

{ #category : #'*BL-Model-Query' }
BLPage class >> color [
	^ Color veryVeryDarkGray
]

{ #category : #'*BL-Model-Query' }
BLPage >> outgoingElement [
	^ {self businessPage} flatten
]
