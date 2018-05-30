visiting
visitLocalVariableDeclarationStatementNode: aLocalVariableDeclarationStatementNode
	self visitNode: aLocalVariableDeclarationStatementNode type.
	aLocalVariableDeclarationStatementNode modifiers ifNotNil: [ self visitNodes: aLocalVariableDeclarationStatementNode modifiers ].
	aLocalVariableDeclarationStatementNode declarators do: [:each | self visitNode: each ]