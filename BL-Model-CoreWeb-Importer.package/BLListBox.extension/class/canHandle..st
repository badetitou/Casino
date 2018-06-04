*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLListBox|ListBox' substrings: '|') includes: anInvocation invokedClassName