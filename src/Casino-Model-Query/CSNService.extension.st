Extension { #name : #CSNService }

{ #category : #'*Casino-Model-Query' }
CSNService >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ]
]

{ #category : #'*Casino-Model-Query' }
CSNService >> color [
	^ Color orange
]

{ #category : #'*Casino-Model-Query' }
CSNService >> outgoingElement [
	^ self actions
]
