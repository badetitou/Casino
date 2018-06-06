Extension { #name : #PJWhileStatementNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJWhileStatementNode >> angularString [
	^ 'while(', self expression angularString ,')', self statement angularString 
]
