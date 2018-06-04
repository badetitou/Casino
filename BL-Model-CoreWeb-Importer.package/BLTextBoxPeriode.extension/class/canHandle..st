*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLTextBoxPeriode|BLTextBoxPeriodePicker' substrings: '|') includes: anInvocation invokedClassName