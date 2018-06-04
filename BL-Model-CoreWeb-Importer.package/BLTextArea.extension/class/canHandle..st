*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLTextArea|TextArea' substrings: '|') includes: anInvocation invokedClassName