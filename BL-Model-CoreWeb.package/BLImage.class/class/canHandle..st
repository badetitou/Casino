testing
canHandle: anInvocation
	^ ('BLImage|BLImageButton|Image' substrings: '|') includes: anInvocation invokedClassName