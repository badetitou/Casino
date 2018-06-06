Extension { #name : #PJParameterDeclaratorNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJParameterDeclaratorNode >> angularString [
	^ self identifier angularString, ','
]
