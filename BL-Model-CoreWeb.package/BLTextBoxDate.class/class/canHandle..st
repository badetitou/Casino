testing
canHandle: anInvocation
	^ ('BLTextBoxDate|BLTextBoxDatePicker' substrings: '|') includes: anInvocation invokedClassName