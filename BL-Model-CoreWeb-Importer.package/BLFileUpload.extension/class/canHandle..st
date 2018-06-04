*BL-Model-CoreWeb-Importer
canHandle: anInvocation
	^ 'BLFileUpload*|BLImageUploadPanel' asRegex matchesPrefix: anInvocation invokedClassName