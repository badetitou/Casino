operations
createNewIndividual
	| trace |
	trace := self newFunction.
	trace addChild: self newTerminal.
	trace addChild: self newTerminal.
	trace addChild: self newTerminal.
	trace addChild: self newTerminal.
	^trace 