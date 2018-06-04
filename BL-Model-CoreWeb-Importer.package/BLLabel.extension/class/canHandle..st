*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLLabel|Label' substrings: '|') includes: anInvocation invokedClassName