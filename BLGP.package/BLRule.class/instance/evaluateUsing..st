initialization
evaluateUsing: aContext
	(self isRunnableUsing: aContext)
		ifTrue: [ self run ]