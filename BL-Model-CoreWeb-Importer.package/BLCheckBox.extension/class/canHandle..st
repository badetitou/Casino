*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLCheckBox|CheckBox' substrings: '|') includes: anInvocation invokedClassName