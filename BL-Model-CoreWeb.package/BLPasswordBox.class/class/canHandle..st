testing
canHandle: anInvocation
	^ 'BLPasswordBox|PasswordTextBox' asRegex matchesPrefix: anInvocation invokedClassName