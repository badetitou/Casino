initialization
initialize
	super initialize.
	self rightModel: MooseModel new. 
	self printBlock: [ :child :cxt | 'Trace : ' ].
	self
		evaluationBlock: [ :child :cxt | 
			child do: [ :ch | ch evaluateUsing: cxt ].
			self rightModel ]