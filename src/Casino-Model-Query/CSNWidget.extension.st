Extension { #name : #CSNWidget }

{ #category : #'*Casino-Model-Query' }
CSNWidget >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ].
	^ self actionAppels collect: [ :a | a -> self actionAppels collect: #accessesAtLevel ]
]

{ #category : #'*Casino-Model-Query' }
CSNWidget class >> color [
	^ Color yellow
]

{ #category : #'*Casino-Model-Query' }
CSNWidget >> color [
	^ self class color
]

{ #category : #'*Casino-Model-Query' }
CSNWidget >> outgoingElement [
	^ { self widgets }
]
