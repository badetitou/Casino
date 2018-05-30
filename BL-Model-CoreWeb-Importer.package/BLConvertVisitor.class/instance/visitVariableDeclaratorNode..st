visiting
visitVariableDeclaratorNode: aVariableDeclaratorNode
	self visitNode: aVariableDeclaratorNode variable.
	(aVariableDeclaratorNode initializer flattened reject: [:each | each isNil or: [ each isToken ] ]) do: [:each | self visitNode: each]