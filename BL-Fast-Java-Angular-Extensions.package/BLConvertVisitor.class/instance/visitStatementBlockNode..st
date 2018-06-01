visiting
visitStatementBlockNode: aStatementBlockNode
	aStatementBlockNode statements do: [:each | self visitNode: each ].