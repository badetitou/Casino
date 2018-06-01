visiting
visitIfStatementNode: anIfStatementNode
	self visitNode: anIfStatementNode condition.
	self visitNode: anIfStatementNode thenPart.
	anIfStatementNode elsePart ifNotNil: [ self visitNode: anIfStatementNode elsePart] 