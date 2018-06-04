*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLDefaultQuickSearch|QuicksearchExempleREL' substrings: '|') includes: anInvocation invokedClassName