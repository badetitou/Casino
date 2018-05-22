testing
canHandle: anInvocation
	^ ('BLLabel|Label' substrings: '|') includes: anInvocation invokedClassName