testing
canHandle: anInvocation
	^ ('BLDefaultQuickSearch|QuicksearchExempleREL' substrings: '|') includes: anInvocation invokedClassName