testing
canHandle: anInvocation
	^ '.*HorizontalPanel' asRegex matchesPrefix: anInvocation invokedClassName