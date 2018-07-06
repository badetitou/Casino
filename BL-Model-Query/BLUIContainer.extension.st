Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Query' }
BLUIContainer >> outgoingElement [
	^ {self actions collect: #call. self widgets} flatten
]
