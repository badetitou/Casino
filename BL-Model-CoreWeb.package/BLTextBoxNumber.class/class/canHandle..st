testing
canHandle: anInvocation
	^ 'BLTextBoxNumber' asRegex matchesPrefix: anInvocation invokedClassName