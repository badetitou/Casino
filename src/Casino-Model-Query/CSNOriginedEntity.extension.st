Extension { #name : #CSNOriginedEntity }

{ #category : #'*Casino-Model-Query' }
CSNOriginedEntity >> allAssociations [
	^ self outgoingElement flattened collect: [ :el | Association new key: self value: el ]
]
