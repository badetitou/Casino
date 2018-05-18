testing
canHandle: anInvocation
	^ 'BLFieldSetPanel' asRegex matchesPrefix: anInvocation invokedClassName