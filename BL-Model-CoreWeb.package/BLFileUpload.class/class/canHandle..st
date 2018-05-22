testing
canHandle: anInvocation
	^ 'BLFileUpload*|BLImageUploadPanel' asRegex matchesPrefix: anInvocation invokedClassName