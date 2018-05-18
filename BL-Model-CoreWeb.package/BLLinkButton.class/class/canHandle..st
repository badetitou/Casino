testing
canHandle: anInvocation
	^ 'Button|BLLinkButton' asRegex matchesPrefix: anInvocation invokedClassName