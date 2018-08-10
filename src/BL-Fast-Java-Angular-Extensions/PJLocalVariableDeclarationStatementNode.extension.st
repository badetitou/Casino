Extension { #name : #PJLocalVariableDeclarationStatementNode }

{ #category : #'*BL-Fast-Java-Angular-Extensions' }
PJLocalVariableDeclarationStatementNode >> angularString [
	^ 'let ', (self declarators flatCollect: [ :declarator | declarator angularString, ' ' ]), ';'.
]
