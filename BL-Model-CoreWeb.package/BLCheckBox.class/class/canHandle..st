testing
canHandle: anInvocation
	^ 'BLCheckBox' asRegex matchesPrefix: anInvocation invokedClassName