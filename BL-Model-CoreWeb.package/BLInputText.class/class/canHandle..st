testing
canHandle: anInvocation
	^ 'BLTextBox' asRegex matchesPrefix: anInvocation invokedClassName