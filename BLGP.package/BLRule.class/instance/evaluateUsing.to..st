initialization
evaluateUsing: aContext to: aModel
	(self isRunnableUsing: aContext)
		ifTrue: [ self run ]