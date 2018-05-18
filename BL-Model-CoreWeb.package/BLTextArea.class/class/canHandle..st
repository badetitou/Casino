testing
canHandle: anInvocation
	^ 'BLTextArea|TextArea' asRegex matchesPrefix: anInvocation invokedClassName