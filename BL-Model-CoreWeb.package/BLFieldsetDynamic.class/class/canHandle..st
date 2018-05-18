testing
canHandle: anInvocation
	^ 'BLFieldSetPanelDynamic|BLGroupBoxPanel' asRegex matchesPrefix: anInvocation invokedClassName