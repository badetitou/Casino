*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLTextBoxDate|BLTextBoxDatePicker' substrings: '|') includes: anInvocation invokedClassName