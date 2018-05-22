testing
canHandle: anInvocation
	^ ('BLTextBox|TextBox' substrings: '|') includes: anInvocation invokedClassName