testing
canHandle: anInvocation
	^ 'BLTextBoxPeriode|BLTextBoxPeriodePicker' asRegex matchesPrefix: anInvocation invokedClassName