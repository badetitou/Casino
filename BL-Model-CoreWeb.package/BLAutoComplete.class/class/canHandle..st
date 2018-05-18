testing
canHandle: anInvocation
	^ 'BLDefaultQuickSearch' asRegex
		matchesPrefix: anInvocation invokedClassName