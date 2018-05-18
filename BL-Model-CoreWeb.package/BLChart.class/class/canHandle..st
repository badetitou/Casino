testing
canHandle: anInvocation
	^ '.*Chart.*' asRegex matchesPrefix: anInvocation invokedClassName