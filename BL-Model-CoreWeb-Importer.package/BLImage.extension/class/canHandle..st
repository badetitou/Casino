*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ ('BLImage|BLImageButton|Image' substrings: '|') includes: anInvocation invokedClassName