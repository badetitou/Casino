Extension { #name : #BLUIPanel }

{ #category : #'*BL-Model-Query' }
BLUIPanel >> outgoingElement [
	^ {self actions collect: #call. self widgets. {self layout}} flatten
]
