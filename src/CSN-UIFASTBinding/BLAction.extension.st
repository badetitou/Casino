Extension { #name : #BLAction }

{ #category : #'*CSN-UIFASTBinding' }
BLAction >> behaviour [
	<MSEProperty: #behaviour type: #Object>
	<subordinate>
	^ self privateState attributeAt: #behaviour ifAbsent: [  ]
]

{ #category : #'*CSN-UIFASTBinding' }
BLAction >> behaviour: anObject [
	self privateState attributeAt: #behaviour put: anObject.
	anObject ui: self
]
