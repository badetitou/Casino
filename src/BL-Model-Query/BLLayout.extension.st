Extension { #name : #BLLayout }

{ #category : #'*BL-Model-Query' }
BLLayout >> color [
	^ self class color
]

{ #category : #'*BL-Model-Query' }
BLLayout class >> color [
	^ Color pink
]

{ #category : #'*BL-Model-Query' }
BLLayout >> outgoingElement [
	^ self cell
]
