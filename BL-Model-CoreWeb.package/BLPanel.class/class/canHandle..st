testing
canHandle: anInvocation
	^ '.*Panel' asRegex matchesPrefix: anInvocation invokedClassName