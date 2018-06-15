Extension { #name : #BLUIContainer }

{ #category : #'*BL-Model-Query' }
BLUIContainer >> outgoingElement [
	^ {self actions collect: #actionAppelOwner. self widgets} flatten
]
