initialization
initialize
	super initialize.
	conditions := OrderedCollection new.
	executions := OrderedCollection new.
	self evaluationBlock: [ :child :ctx |  ]