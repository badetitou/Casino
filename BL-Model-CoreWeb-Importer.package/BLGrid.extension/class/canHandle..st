*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLFlexTable|BLGrid' substrings: '|') includes: anInvocation invokedClassName