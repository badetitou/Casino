testing
canHandle: anInvocation
	^ 'Button|BLLinkButton' matches: anInvocation invokedClass name