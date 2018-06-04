*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLPasswordBox|PasswordTextBox' substrings: '|') includes: anInvocation invokedClassName