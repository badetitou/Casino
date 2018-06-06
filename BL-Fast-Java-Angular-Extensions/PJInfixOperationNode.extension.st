Extension { #name : #PJInfixOperationNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJInfixOperationNode >> angularString [
	^ (self left angularString) , ' ', (self operator angularString) , ' ' , (self right angularString )
]
