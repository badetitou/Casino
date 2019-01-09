Extension { #name : #FASTEntity }

{ #category : #'*CSN-UIFASTBinding' }
FASTEntity >> ui [
	<MSEProperty: #ui type: #Object > 
    ^ self privateState 
            attributeAt: #ui
            ifAbsent: []
]

{ #category : #'*CSN-UIFASTBinding' }
FASTEntity >> ui: anObject [
	(self privateState attributeAt: #ui ifAbsent: [ nil ]) == anObject
		ifTrue: [ ^ anObject ].
	self privateState attributeAt: #ui put: anObject.
	anObject behaviour: self
]
