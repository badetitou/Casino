Extension { #name : #PJStringLiteralNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJStringLiteralNode >> angularString [
	^ '''', self literalValue, ''''
]
