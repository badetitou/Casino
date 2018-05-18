testing
canHandle: anInvocation
	^ 'BLLabel|Label' asRegex matchesPrefix: anInvocation invokedClassName