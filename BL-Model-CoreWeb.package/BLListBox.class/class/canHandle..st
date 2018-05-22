testing
canHandle: anInvocation
	^ ('BLListBox|ListBox' substrings: '|') includes: anInvocation invokedClassName