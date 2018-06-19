Extension { #name : #BLUILeaf }

{ #category : #'*BL-Model-Query' }
BLUILeaf >> outgoingElement [
	^ (self actionAppels collect: #value)
]
