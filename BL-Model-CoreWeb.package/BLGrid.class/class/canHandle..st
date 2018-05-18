testing
canHandle: anInvocation
	^ 'BLFlexTable|BLGrid' asRegex matchesPrefix: anInvocation invokedClassName