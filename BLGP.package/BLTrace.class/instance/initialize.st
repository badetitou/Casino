initialization
initialize
	super initialize.
	self printBlock: [ :child :cxt | 'Trace : ' ].
	self evaluationBlock: [ :child :cxt | child do: [ :ch | ch evaluateUsing: cxt ] ]