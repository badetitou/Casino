Extension { #name : #BLPhase }

{ #category : #'*BL-Model-Query' }
BLPhase >> accessesAtLevel: aLevel [
	aLevel == 0
		ifTrue: [ ^ nil ]
]

{ #category : #'*BL-Model-Query' }
BLPhase >> color [
	^ self pageMetiers ifEmpty: [ Color yellow ] ifNotEmpty: [ Color blue ]
]

{ #category : #'*BL-Model-Query' }
BLPhase >> linkToMetier [
	^ self pageMetiers collect: [ :metier | self -> metier ]
]

{ #category : #'*BL-Model-Query' }
BLPhase >> linkToWidgets [
	^ self widgets collect: [ :metier | self -> metier ]
]

{ #category : #'*BL-Model-Query' }
BLPhase >> outgoingElement [
	^ self pageMetiers
]

{ #category : #'*BL-Model-Query' }
BLPhase >> recursiveMetierNode [
	^ self pageMetiers flatCollect: #recursiveMetierNodes
]

{ #category : #'*BL-Model-Query' }
BLPhase >> recursiveWidget [
	| od |
	od := (self pageMetiers collect: #recursiveMetier) flattened.
	^ (od flatCollect: #recursiveWidget) flattened
]

{ #category : #'*BL-Model-Query' }
BLPhase >> recursiveWidgetAssoc [
	^ self recursiveWidget  collect: [ :el | Association new key: self value: el ]
]
