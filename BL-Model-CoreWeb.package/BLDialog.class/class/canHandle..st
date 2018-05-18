testing
canHandle: anInvocation
	^ 'BLDialogBox' asRegex matchesPrefix: anInvocation invokedClassName