Extension { #name : #BLOriginedEntity }

{ #category : #'*BL-Model-Query' }
BLOriginedEntity >> allAssociations [
	^ self outgoingElement flattened collect: [ :el | Association new key: self value: el ]
]
