testing
canHandle: anInvocation
	^ ('BLTextBoxPeriode|BLTextBoxPeriodePicker' substrings: '|') includes: anInvocation invokedClassName