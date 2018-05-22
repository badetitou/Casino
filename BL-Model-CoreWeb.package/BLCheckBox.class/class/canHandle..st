testing
canHandle: anInvocation
	^ ('BLCheckBox|CheckBox' substrings: '|') includes: anInvocation invokedClassName