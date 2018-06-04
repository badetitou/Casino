*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('Button|BLLinkButton' substrings: '|') includes: anInvocation invokedClassName