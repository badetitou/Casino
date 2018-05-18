testing
canHandle: anInvocation
	^ 'BLProgressBar' asRegex matchesPrefix: anInvocation invokedClassName