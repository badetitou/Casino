Extension { #name : #CSNLayout }

{ #category : #'*Casino-Model-Query' }
CSNLayout class >> color [
	^ Color pink
]

{ #category : #'*Casino-Model-Query' }
CSNLayout >> color [
	^ self class color
]

{ #category : #'*Casino-Model-Query' }
CSNLayout >> outgoingElement [
	^ self cell
]
