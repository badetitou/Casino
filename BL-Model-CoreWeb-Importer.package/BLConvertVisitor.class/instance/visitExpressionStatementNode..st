visiting
visitExpressionStatementNode: anExpressionStatementNode
	 (anExpressionStatementNode expression flattened reject: [ :each | each isNil or: [each isToken]  ]) do: [:each | self visitNode: each ]