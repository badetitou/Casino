Extension { #name : #BLOriginedEntity }

{ #category : #'*BL-Model-Query' }
BLOriginedEntity >> allAssociations [
	^ self outgoingElement collect: [ :el | Association new key: self value: el ]
]
