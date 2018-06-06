Extension { #name : #BLService }

{ #category : #'*BL-Model-Query' }
BLService >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ]
]

{ #category : #'*BL-Model-Query' }
BLService >> color [
	^ Color orange
]

{ #category : #'*BL-Model-Query' }
BLService >> outgoingElement [
	^ self actions
]
