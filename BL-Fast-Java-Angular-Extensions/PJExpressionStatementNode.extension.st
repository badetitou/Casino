Extension { #name : #PJExpressionStatementNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJExpressionStatementNode >> angularString [
	^ self expression angularString ,';'
]
