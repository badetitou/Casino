testing
canHandle: anInvocation
	^ 'BLTextBoxDate|BLTextBoxDatePicker' asRegex matchesPrefix: anInvocation invokedClassName