testing
canHandle: anInvocation
	^ ('BLFlexTable|BLGrid' substrings: '|') includes: anInvocation invokedClassName