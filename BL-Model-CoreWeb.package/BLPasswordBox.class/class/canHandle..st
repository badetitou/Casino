testing
canHandle: anInvocation
	^ ('BLPasswordBox|PasswordTextBox' substrings: '|') includes: anInvocation invokedClassName