Extension { #name : #PJIfStatementNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJIfStatementNode >> angularString [
	| text |
	text := 'if (', self condition angularString , ')', self thenPart angularString .
	self elsePart ifNotNil: [ text := text , 'else ', self elsePart angularString ].
	^ text
]
