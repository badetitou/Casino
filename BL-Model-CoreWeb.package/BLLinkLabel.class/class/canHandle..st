testing
canHandle: anInvocation
	^ 'BLLinkLabel' asRegex matchesPrefix: anInvocation invokedClassName