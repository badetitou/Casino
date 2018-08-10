Extension { #name : #PJASTNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJASTNode >> angularString [
	^ self subclassResponsibility 
]

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJASTNode >> isToken [
	^ false
]
