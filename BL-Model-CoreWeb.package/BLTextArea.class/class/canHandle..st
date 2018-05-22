testing
canHandle: anInvocation
	^ ('BLTextArea|TextArea' substrings: '|') includes: anInvocation invokedClassName