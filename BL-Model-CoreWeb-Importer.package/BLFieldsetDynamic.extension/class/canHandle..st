*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLFieldSetPanelDynamic|BLGroupBoxPanel' substrings: '|') includes: anInvocation invokedClassName