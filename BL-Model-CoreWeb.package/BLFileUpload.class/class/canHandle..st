testing
canHandle: anInvocation
	^ 'BLFileUpload*' asRegex matchesPrefix: anInvocation invokedClassName