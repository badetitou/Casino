Extension { #name : #BLWidget }

{ #category : #'*BL-Model-Query' }
BLWidget >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ].
	^ self actionAppels collect: [ :a | a -> self actionAppels collect: #accessesAtLevel ]
]

{ #category : #'*BL-Model-Query' }
BLWidget >> color [
	^ Color green
]

{ #category : #'*BL-Model-Query' }
BLWidget >> outgoingElement [
	^ {self actionsAppel collect: #value. self widgets} flatten
]

{ #category : #'*BL-Model-Query' }
BLWidget >> recursiveWidget [
	^ {self.
	(self widgets collect: #recursiveWidget)}
]
