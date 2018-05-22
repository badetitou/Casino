testing
canHandle: anInvocation
	^ ('Button|BLLinkButton' substrings: '|') includes: anInvocation invokedClassName