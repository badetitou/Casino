testing
canHandle: anInvocation
	^ ('BLFieldSetPanelDynamic|BLGroupBoxPanel' substrings: '|') includes: anInvocation invokedClassName