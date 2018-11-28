Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Query' }
BLWidget >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ].
	^ self actionAppels collect: [ :a | a -> self actionAppels collect: #accessesAtLevel ]
]

{ #category : #'*BL-Model-Query' }
BLWidget >> color [
	^ self class color
]

{ #category : #'*BL-Model-Query' }
BLWidget class >> color [
	^ Color yellow
]

{ #category : #'*BL-Model-Query' }
BLWidget >> outgoingElement [
	^ { self widgets }
]

{ #category : #'*BL-Model-Query' }
BLWidget >> recursiveWidget [
	^ {self.
	(self widgets collect: #recursiveWidget)}
]
