*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLTextBox|TextBox' substrings: '|') includes: anInvocation invokedClassName