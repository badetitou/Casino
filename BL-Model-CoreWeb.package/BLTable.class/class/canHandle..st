testing
canHandle: anInvocation
	^ 'BLTableList*' asRegex matchesPrefix: anInvocation invokedClassName