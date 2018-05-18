meta
canHandle: anInvocation
	^ 'HTML' asRegex matchesPrefix: anInvocation invokedClassName